import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:home_care/core/core.dart';
import 'package:open_filex/open_filex.dart';
import 'package:path_provider/path_provider.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfViewer extends StatefulWidget {
  final File? file;
  final String? url;
  final String? downloadUrl;
  final String? fileType;

  const PdfViewer({
    super.key,
    this.file,
    this.url,
    this.downloadUrl,
    this.fileType,
  });

  @override
  State<PdfViewer> createState() => _PdfViewerState();
}

class _PdfViewerState extends State<PdfViewer> {
  File _cachedFile = File("");
  bool _isLoaded = false;
  String? _enc;

  Future<void> makeEncryptedUrl() async {
    final enc = await Utils.getEncryptToken();

    if (widget.url != null) {
      final file = await DefaultCacheManager().downloadFile("${widget.url}?secret=$enc");

      setState(() {
        _cachedFile = file.file;
      });
    }

    if (widget.file != null) {
      setState(() {
        _cachedFile = widget.file!;
      });
    }

    setState(() {
      _isLoaded = true;
      _enc = enc;
    });
  }

  @override
  void initState() {
    super.initState();
    makeEncryptedUrl();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final lang = Utils.languageOf(context);

    if (!_isLoaded) {
      return const Center(child: CircularProgressIndicator());
    }

    return _cachedFile.path.isNotEmpty
        ? SfPdfViewer.file(_cachedFile)
        : Container(
            color: Colors.white,
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  lang.document_not_supported_preview,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
                Visibility(
                  visible: widget.downloadUrl != null,
                  child: GestureDetector(
                    onTap: () {
                      _downloadFile();
                    },
                    child: const Icon(
                      Icons.download,
                      color: Colors.blue,
                      size: 40,
                    ),
                  ),
                ),
              ],
            ),
          );
  }

  Future<void> _downloadFile() async {
    final dio = Dio();
    final downloadDir = await getApplicationCacheDirectory();
    final fileDownloadPath =
        "${downloadDir.path}/downloads/${DateTime.now().millisecondsSinceEpoch}.${widget.fileType}";
    final downloadUrl = "${widget.downloadUrl}?secret=$_enc";

    final res = await dio.download(
      downloadUrl,
      fileDownloadPath,
      onReceiveProgress: (rec, total) {
        debugPrint("Rec: $rec , Total: $total");

        if (mounted) {
          setState(() {
            _isLoaded = false;
          });
        }
      },
    );

    if (res.statusCode == 200) {
      setState(() {
        _isLoaded = true;
      });
    }

    debugPrint("File: $fileDownloadPath");

    final openFile = await OpenFilex.open(fileDownloadPath);

    debugPrint("OpenFile: ${openFile.message}");
  }
}
