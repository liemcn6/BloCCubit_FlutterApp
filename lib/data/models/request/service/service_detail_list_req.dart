class ServiceDetailListReq {
  final List<String>? buildingIds;
  final List<String>? facilityGroupIds;
  final int? pageIndex;
  final int? pageSize;

  ServiceDetailListReq({
    this.buildingIds,
    this.facilityGroupIds,
    this.pageSize = 15,
    this.pageIndex,
  });

  Map<String, dynamic> toMap() {
    return {
      'buildingIds': buildingIds,
      'facilityGroupIds': facilityGroupIds,
      'pageIndex': pageIndex,
      'pageSize': pageSize,
    };
  }
}
