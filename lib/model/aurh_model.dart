class AttendanceModel {
  String? status;
  String? message;
  List<Data>? data;
  String? currentMonth;
  AttendanceCount? attendanceCount;
  ClockCount? clockCount;

  AttendanceModel(
      {this.status,
      this.message,
      this.data,
      this.currentMonth,
      this.attendanceCount,
      this.clockCount});

  AttendanceModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    currentMonth = json['currentMonth'];
    attendanceCount = json['attendanceCount'] != null
        ? new AttendanceCount.fromJson(json['attendanceCount'])
        : null;
    clockCount = json['clockCount'] != null
        ? new ClockCount.fromJson(json['clockCount'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['currentMonth'] = this.currentMonth;
    if (this.attendanceCount != null) {
      data['attendanceCount'] = this.attendanceCount!.toJson();
    }
    if (this.clockCount != null) {
      data['clockCount'] = this.clockCount!.toJson();
    }
    return data;
  }
}

class Data {
  String? sId;
  String? onDate;
  String? userId;
  String? sAPID;
  CheckIn? checkIn;
  CheckIn? checkOut;
  String? status;
  int? timeDiff;
  String? remarks;

  Data(
      {this.sId,
      this.onDate,
      this.userId,
      this.sAPID,
      this.checkIn,
      this.checkOut,
      this.status,
      this.timeDiff,
      this.remarks});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    onDate = json['onDate'];
    userId = json['userId'];
    sAPID = json['SAP_ID'];
    checkIn =
        json['checkIn'] != null ? new CheckIn.fromJson(json['checkIn']) : null;
    checkOut = json['checkOut'] != null
        ? new CheckIn.fromJson(json['checkOut'])
        : null;
    status = json['status'];
    timeDiff = json['timeDiff'];
    remarks = json['remarks'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['onDate'] = this.onDate;
    data['userId'] = this.userId;
    data['SAP_ID'] = this.sAPID;
    if (this.checkIn != null) {
      data['checkIn'] = this.checkIn!.toJson();
    }
    if (this.checkOut != null) {
      data['checkOut'] = this.checkOut!.toJson();
    }
    data['status'] = this.status;
    data['timeDiff'] = this.timeDiff;
    data['remarks'] = this.remarks;
    return data;
  }
}

class CheckIn {
  String? time;
  Location? location;

  CheckIn({this.time, this.location});

  CheckIn.fromJson(Map<String, dynamic> json) {
    time = json['time'];
    location = json['location'] != null
        ? new Location.fromJson(json['location'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['time'] = this.time;
    if (this.location != null) {
      data['location'] = this.location!.toJson();
    }
    return data;
  }
}

class Location {
  double? lat;
  double? long;

  Location({this.lat, this.long});

  Location.fromJson(Map<String, dynamic> json) {
    lat = json['lat'];
    long = json['long'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['lat'] = this.lat;
    data['long'] = this.long;
    return data;
  }
}

class AttendanceCount {
  int? present;
  int? leaveRejected;
  int? leaveApproved;
  int? earlyCheckOut;

  AttendanceCount(
      {this.present,
      this.leaveRejected,
      this.leaveApproved,
      this.earlyCheckOut});

  AttendanceCount.fromJson(Map<String, dynamic> json) {
    present = json['Present'];
    leaveRejected = json['Leave Rejected'];
    leaveApproved = json['Leave Approved'];
    earlyCheckOut = json['Early CheckOut'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Present'] = this.present;
    data['Leave Rejected'] = this.leaveRejected;
    data['Leave Approved'] = this.leaveApproved;
    data['Early CheckOut'] = this.earlyCheckOut;
    return data;
  }
}

class ClockCount {
  int? lateClockIn;
  int? earlyClockOut;
  int? leaveCount;
  int? absentCount;

  ClockCount(
      {this.lateClockIn,
      this.earlyClockOut,
      this.leaveCount,
      this.absentCount});

  ClockCount.fromJson(Map<String, dynamic> json) {
    lateClockIn = json['lateClockIn'];
    earlyClockOut = json['earlyClockOut'];
    leaveCount = json['leaveCount'];
    absentCount = json['absentCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['lateClockIn'] = this.lateClockIn;
    data['earlyClockOut'] = this.earlyClockOut;
    data['leaveCount'] = this.leaveCount;
    data['absentCount'] = this.absentCount;
    return data;
  }
}
