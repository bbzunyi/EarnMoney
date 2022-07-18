//
//  JobDetail.swift
//  EarnMoney
//
//  Created by bb on 2022/5/15.
//

import UIKit

class JobDetail: NSObject {
    var contactor:String
    var phone_number:String
    var address:String
    var jobname:String
    var jobtype:String
    var firm_name:String
    var require_num:String
    var salary:String
    var start_time:String
    var end_time:String
    var work_position:String
    var work_description:String
    var work_requirement:String
    var work_necessary_description:String
    var work_peomeasure:String
    
    override init() {
        self.jobname = ""
        self.jobtype = ""
        self.firm_name = ""
        self.require_num = ""
        self.salary = ""
        self.start_time = ""
        self.end_time = ""
        self.work_position = ""
        self.work_description = ""
        self.work_requirement = ""
        self.work_necessary_description = ""
        self.work_peomeasure = ""
        self.contactor = ""
        self.phone_number = ""
        self.address = ""
    }
    init( jobname:String,jobtype:String,firm_name:String,require_num:String,salary:String,start_time:String
          ,end_time:String,work_position:String,work_description:String,work_requirement:String,work_necessary_description:String,work_peomeasure:String,contactor:String,phone_number:String,address:String) {
        self.jobname = jobname
        self.jobtype = jobtype
        self.firm_name = firm_name
        self.require_num = require_num
        self.salary = salary
        self.start_time = start_time
        self.end_time = end_time
        self.work_position = work_position
        self.work_description = work_description
        self.work_requirement = work_requirement
        self.work_necessary_description = work_necessary_description
        self.work_peomeasure = work_peomeasure
        self.contactor = contactor
        self.phone_number = phone_number
        self.address = address
    }
    
    func encode()->[String]{
        return [jobname,jobtype,firm_name,require_num,salary,start_time,end_time,work_position,work_description,work_requirement,work_necessary_description,work_peomeasure,contactor,phone_number,address]
    }
    
}
