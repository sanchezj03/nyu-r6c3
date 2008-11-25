# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of ActiveRecord to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 51) do

  create_table "ExportingCGs", :force => true do |t|
    t.integer "caregiver_id"
    t.string  "first_name",   :limit => 100
    t.string  "last_name",    :limit => 100
  end

  create_table "Newteachers", :id => false, :force => true do |t|
    t.float  "class"
    t.string "FirstName", :limit => 9
    t.string "LastName",  :limit => 19
    t.float  "s"
    t.string "School",    :limit => 22
    t.float  "StaffId"
  end

  create_table "TblMainAddressesV1", :force => true do |t|
    t.integer  "ChildId"
    t.string   "comments",      :limit => 1000
    t.string   "dateCollected", :limit => 30
    t.string   "FAdd",          :limit => 400
    t.string   "FApt",          :limit => 100
    t.string   "FCity",         :limit => 100
    t.string   "FState",        :limit => 100
    t.string   "FZip",          :limit => 50
    t.datetime "now"
    t.integer  "pair"
    t.integer  "RChildId"
  end

  create_table "TblPhoneNumbersV1", :force => true do |t|
    t.integer  "ChildId"
    t.string   "comments",      :limit => 1000
    t.string   "dateCollected", :limit => 30
    t.string   "FCellPhonea",   :limit => 40
    t.string   "FCellPhoneb",   :limit => 40
    t.string   "FHomePhone",    :limit => 40
    t.string   "FWPhonea",      :limit => 40
    t.string   "FWPhoneb",      :limit => 40
    t.datetime "now"
    t.integer  "RChildId"
  end

  create_table "addresses", :force => true do |t|
    t.string   "apartment",    :limit => 100
    t.integer  "caregiver_id"
    t.string   "city",         :limit => 100
    t.datetime "collected_on"
    t.string   "comments",     :limit => 1000
    t.string   "country",      :limit => 100
    t.datetime "created_on"
    t.string   "dt",           :limit => 100
    t.string   "home_number",  :limit => 100
    t.string   "state",        :limit => 100
    t.string   "street",       :limit => 510
    t.integer  "user_id"
    t.string   "zip_code",     :limit => 100
  end

  create_table "blue_card_entries", :force => true do |t|
    t.string   "address"
    t.integer  "child_id"
    t.datetime "collected_on"
    t.datetime "created_on"
    t.string   "dt",            :limit => 100, :default => "getdate"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone_number"
    t.string   "phone_number2"
    t.string   "phone_number3"
    t.string   "ptypeC",        :limit => 8
    t.string   "ptypeH",        :limit => 8
    t.string   "ptypeW",        :limit => 8
    t.string   "relationship"
  end

  create_table "caregiver_relations", :force => true do |t|
    t.string "relation"
  end

  create_table "caregivers", :force => true do |t|
    t.string   "caregiver_id",          :limit => 11
    t.integer  "caregiver_relation_id"
    t.integer  "child_id"
    t.datetime "collected_on"
    t.string   "comments"
    t.datetime "created_on"
    t.string   "dt",                    :limit => 100
    t.string   "first_name",            :limit => 100
    t.string   "last_name",             :limit => 100
    t.string   "relation",              :limit => 50
    t.string   "schedule"
    t.integer  "user_id"
  end

  create_table "cgtest2", :force => true do |t|
    t.string   "caregiver_id",          :limit => 11
    t.integer  "caregiver_relation_id"
    t.integer  "child_id"
    t.datetime "collected_on"
    t.string   "comments"
    t.datetime "created_on"
    t.string   "dt",                    :limit => 100
    t.string   "first_name",            :limit => 100
    t.string   "last_name",             :limit => 100
    t.string   "relation",              :limit => 50
    t.string   "schedule"
    t.integer  "user_id"
  end

  create_table "children", :force => true do |t|
    t.datetime "birthday"
    t.integer  "child_id"
    t.integer  "child_is_linked"
    t.integer  "child_school_id"
    t.integer  "childschoolId2"
    t.integer  "cohort"
    t.datetime "collected_on"
    t.string   "comments"
    t.datetime "created_on"
    t.string   "dt",                    :limit => 100, :default => "getdate"
    t.string   "first_name"
    t.string   "gender",                :limit => 1
    t.integer  "hispanic"
    t.integer  "is_primary"
    t.string   "last_name"
    t.string   "linked_child"
    t.string   "race"
    t.integer  "recruitment_id"
    t.string   "secondary_yoked_child"
    t.integer  "user_id"
    t.integer  "yoked_pair"
  end

  create_table "classrooms", :force => true do |t|
    t.string   "class_id"
    t.datetime "created_on"
    t.integer  "date_year"
    t.string   "dt",         :limit => 100
    t.string   "grade",      :limit => 10
    t.string   "grade_name", :limit => 25
    t.string   "hours",      :limit => 7
    t.integer  "school_id"
    t.integer  "teacher_id"
    t.integer  "user_id"
  end

  create_table "consent_outcome_values", :force => true do |t|
    t.datetime "created_at"
    t.string   "outcome"
    t.datetime "updated_at"
  end

  create_table "consent_outcomes", :force => true do |t|
    t.integer  "caregiver_id"
    t.integer  "child_id"
    t.datetime "collected_on"
    t.text     "comments"
    t.boolean  "consented"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "value"
    t.integer  "withdrawn"
  end

  create_table "consent_outcomes_bk_nov2408", :force => true do |t|
    t.integer  "child_id"
    t.datetime "collected_on"
    t.text     "comments"
    t.boolean  "consented"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "value"
    t.integer  "withdrawn"
  end

  create_table "consent_reasons", :force => true do |t|
    t.integer "number"
    t.string  "reason"
    t.integer "yes"
  end

  create_table "consents", :force => true do |t|
    t.integer  "caregiver_id"
    t.integer  "child_id"
    t.datetime "collected_on"
    t.string   "comments"
    t.integer  "consent_reason_id"
    t.integer  "consented"
    t.datetime "created_on"
    t.string   "dt",                   :limit => 100, :default => "getdate"
    t.integer  "is_primary_caregiver"
    t.integer  "phase"
    t.integer  "user_id"
    t.integer  "withdrawn"
  end

  create_table "eligibilities", :force => true do |t|
    t.integer  "child_id"
    t.integer  "cohort"
    t.datetime "collected_on"
    t.string   "comments"
    t.datetime "created_on"
    t.integer  "eligible"
    t.integer  "reason_id"
    t.string   "type",         :limit => 20
    t.integer  "user_id"
  end

  create_table "eligibility_reasons", :force => true do |t|
    t.integer "cohort"
    t.integer "eligible"
    t.integer "number"
    t.string  "reason"
  end

  create_table "eligibility_reasons1", :force => true do |t|
    t.integer "cohort"
    t.integer "number"
    t.string  "reason"
  end

  create_table "emails", :force => true do |t|
    t.integer  "caregiver_id"
    t.datetime "created_on"
    t.string   "email"
    t.integer  "user_id"
  end

  create_table "familymembers", :force => true do |t|
    t.datetime "birthday"
    t.integer  "deceased",                 :null => false
    t.string   "name"
    t.string   "relation"
    t.string   "session_id", :limit => 64, :null => false
  end

  create_table "followup_eligibilities", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "interview_testing_outcomes", :force => true do |t|
    t.string "status", :limit => 150
  end

  create_table "interviews", :force => true do |t|
    t.integer  "child_id"
    t.string   "comments"
    t.datetime "created_at"
    t.string   "status"
    t.string   "type"
    t.datetime "updated_at"
  end

  create_table "location_statuses", :force => true do |t|
    t.integer "in_target_school"
    t.string  "text"
  end

  create_table "locations", :force => true do |t|
    t.integer  "anticipated_location"
    t.integer  "child_id"
    t.integer  "classroom_id"
    t.datetime "collected_on"
    t.string   "comments"
    t.datetime "created_on"
    t.integer  "lost_fall"
    t.integer  "lost_fall_id"
    t.integer  "lost_spring"
    t.integer  "lost_spring_id"
    t.string   "now",                  :limit => 100
    t.integer  "school_id"
    t.string   "school_other",         :limit => 170
    t.string   "status_id"
    t.string   "teacher_fn_other",     :limit => 50
    t.string   "teacher_ln_other",     :limit => 50
    t.string   "type",                 :limit => 20,  :null => false
    t.integer  "user_id"
  end

  create_table "lost_data_completion_reasons", :force => true do |t|
    t.string "reason", :limit => 75
  end

  create_table "phones", :force => true do |t|
    t.integer  "caregiver_id"
    t.datetime "collected_on"
    t.string   "comments",     :limit => 510
    t.datetime "created_on"
    t.string   "mode",         :limit => 16
    t.string   "number",       :limit => 510
    t.integer  "user_id"
  end

  create_table "phones_usedJuly2908", :force => true do |t|
    t.integer  "caregiver_id"
    t.datetime "collected_on"
    t.string   "comments",     :limit => 510
    t.datetime "created_on"
    t.string   "mode",         :limit => 16
    t.string   "number",       :limit => 510
    t.integer  "user_id"
  end

  create_table "postchangesbu_july2408", :force => true do |t|
    t.string   "caregiver_id",          :limit => 11
    t.integer  "caregiver_relation_id"
    t.integer  "child_id"
    t.datetime "collected_on"
    t.string   "comments"
    t.datetime "created_on"
    t.string   "dt",                    :limit => 100
    t.string   "first_name",            :limit => 100
    t.string   "last_name",             :limit => 100
    t.string   "relation",              :limit => 50
    t.string   "schedule"
    t.integer  "user_id"
  end

  create_table "schools", :force => true do |t|
    t.string "comments"
    t.string "location"
    t.string "number",   :limit => 100
  end

  create_table "schools_Sep2908v1", :force => true do |t|
    t.string "comments"
    t.string "location"
    t.string "number",   :limit => 100
  end

  create_table "sessionlists", :force => true do |t|
    t.string "session_id", :limit => 64, :null => false
  end

  create_table "sessions", :force => true do |t|
    t.datetime "created_at"
    t.text     "data"
    t.string   "session_id", :null => false
    t.datetime "updated_at"
  end

  create_table "staff", :force => true do |t|
    t.datetime "collected_on"
    t.string   "comments"
    t.datetime "created_on"
    t.integer  "date_year"
    t.string   "first_name"
    t.string   "grade_name",   :limit => 25
    t.string   "last_name"
    t.integer  "school_id"
    t.integer  "teacher_id"
    t.string   "title"
    t.integer  "user_id"
  end

  create_table "staff_titles", :force => true do |t|
    t.string "title"
  end

  create_table "tblMainAddressesV2", :force => true do |t|
    t.integer "ChildId"
    t.string  "comments", :limit => 1000
    t.string  "FAdd",     :limit => 400
    t.string  "FApt",     :limit => 100
    t.string  "FCity",    :limit => 100
    t.string  "FState",   :limit => 100
    t.string  "FZip",     :limit => 50
    t.string  "now",      :limit => 100
    t.integer "RChildId"
  end

  create_table "tblR_Child", :id => false, :force => true do |t|
    t.string   "Address",                          :limit => 200
    t.string   "Address2",                         :limit => 200
    t.string   "contactChangeComments3",           :limit => 1000
    t.string   "contactChangeComments4",           :limit => 1000
    t.string   "contactChangeComments5",           :limit => 1000
    t.string   "DateChangeEliPostRec0607",         :limit => 100
    t.string   "DateChangeEliPostRec0708",         :limit => 100
    t.string   "DateCollected",                    :limit => 100
    t.string   "DatePaid_4thPhoneInterview2",      :limit => 100
    t.string   "DemoInterviewAssigned",            :limit => 200
    t.integer  "DiffListedCGandConsentPerson"
    t.integer  "DisenrollPhase1"
    t.string   "DisenrollPhase1C",                 :limit => 500
    t.string   "DisenrollPhase1D",                 :limit => 24
    t.integer  "DisenrollPhase2"
    t.string   "DisenrollPhase2C",                 :limit => 500
    t.string   "DisenrollPhase2D",                 :limit => 24
    t.integer  "DisenrollPhase3"
    t.string   "DisenrollPhase3C",                 :limit => 500
    t.string   "DisenrollPhase3D",                 :limit => 24
    t.integer  "DisenrollT2"
    t.string   "DisenrollT2Comments",              :limit => 1200
    t.string   "DisenrollT2Date",                  :limit => 100
    t.integer  "droppedoutSchool"
    t.string   "droppedoutSchoolDate",             :limit => 10
    t.integer  "droppedoutStudy"
    t.string   "droppedoutStudyDate",              :limit => 10
    t.integer  "EligibleAtRecruitment"
    t.integer  "EligiblePostRecruitment0607"
    t.integer  "EligiblePostRecruitment0708"
    t.string   "EmailAddressT2",                   :limit => 100
    t.integer  "EmergencyContactInfo"
    t.string   "FamilyAssignment",                 :limit => 200
    t.string   "HomePhone1",                       :limit => 100
    t.string   "HomePhone2_1",                     :limit => 100
    t.string   "HomePhone3_1",                     :limit => 100
    t.string   "HomeVisitCompPart",                :limit => 100
    t.integer  "HvStatus"
    t.integer  "InSchoolFeb1st"
    t.integer  "InSchoolMay1st"
    t.integer  "InSchoolNov1st"
    t.integer  "InSchoolSep1st"
    t.string   "InterviewAssigmentT2",             :limit => 100
    t.string   "InterviewAssigmentT3",             :limit => 100
    t.integer  "leftSchoolEstBefFeb1st_K"
    t.integer  "leftSchoolEstBefNov1st_K"
    t.string   "MeasureTrackingBOR1Comments",      :limit => 800
    t.string   "MeasureTrackingBOR1Date",          :limit => 100
    t.integer  "MeasureTrackingBOR1Status"
    t.string   "MeasureTrackingBOR2Comments",      :limit => 400
    t.string   "MeasureTrackingBOR2Date",          :limit => 100
    t.integer  "MeasureTrackingBOR2Status"
    t.string   "MeasureTrackingBSizeR1Comments",   :limit => 800
    t.string   "MeasureTrackingBSizeR1Date",       :limit => 100
    t.integer  "MeasureTrackingBSizeR1Status"
    t.string   "MeasureTrackingBSizeR2Comments",   :limit => 800
    t.string   "MeasureTrackingBSizeR2Date",       :limit => 100
    t.integer  "MeasureTrackingBSizeR2Status"
    t.string   "MeasureTrackingCPirsR1Comments",   :limit => 800
    t.string   "MeasureTrackingCPirsR1Date",       :limit => 100
    t.integer  "MeasureTrackingCPirsR1Status"
    t.string   "MeasureTrackingCPirsR2Comments",   :limit => 800
    t.string   "MeasureTrackingCPirsR2Date",       :limit => 100
    t.string   "MeasureTrackingCPirsR2Status",     :limit => 100
    t.string   "MeasureTrackingDialR1Comments",    :limit => 800
    t.string   "MeasureTrackingDialR1Date",        :limit => 100
    t.integer  "MeasureTrackingDialR1Status"
    t.string   "MeasureTrackingPEIComments",       :limit => 800
    t.string   "MeasureTrackingPEIDate",           :limit => 100
    t.integer  "MeasureTrackingPEIStatus"
    t.string   "MeasureTrackingPhoneIntDate",      :limit => 100
    t.integer  "MeasureTrackingPhoneIntStatus"
    t.string   "MeasureTrackingR1",                :limit => 100
    t.string   "MeasureTrackingR2",                :limit => 100
    t.string   "MiddleInit",                       :limit => 100
    t.integer  "NClassID"
    t.string   "Nickname",                         :limit => 100
    t.integer  "NotInSchool"
    t.string   "NotInSchoolComments",              :limit => 1000
    t.string   "NotInSchoolDate",                  :limit => 100
    t.string   "now",                              :limit => 200
    t.integer  "paidDemo"
    t.integer  "PaidPV2"
    t.integer  "PaidPV3"
    t.integer  "PaidPV4"
    t.integer  "pcgs1"
    t.integer  "pcgs10"
    t.integer  "pcgs11"
    t.integer  "pcgs12"
    t.integer  "pcgs13"
    t.integer  "pcgs14"
    t.integer  "pcgs2"
    t.integer  "pcgs3"
    t.integer  "pcgs4"
    t.integer  "pcgs5"
    t.integer  "pcgs6"
    t.integer  "pcgs7"
    t.integer  "pcgs8"
    t.integer  "pcgs9"
    t.string   "Phase1Comments",                   :limit => 1400
    t.string   "Phase2Comments",                   :limit => 1400
    t.datetime "Phase2DateConsented"
    t.string   "Phase2PFN",                        :limit => 100
    t.string   "Phase2PLN",                        :limit => 100
    t.string   "Phase3DateConsented",              :limit => 100
    t.string   "PhoneVisit1Assignment",            :limit => 200
    t.string   "PhoneVisit2Assignment",            :limit => 100
    t.string   "PhoneVisit3Assignment",            :limit => 100
    t.string   "PhoneVisit4Assignment",            :limit => 100
    t.string   "pi1comments",                      :limit => 800
    t.string   "pi1comments2",                     :limit => 800
    t.integer  "pi1completeStatus"
    t.integer  "pi1completeStatus2"
    t.string   "pi2comments",                      :limit => 800
    t.string   "pi2comments2",                     :limit => 800
    t.integer  "pi2completeStatus"
    t.integer  "pi2completeStatus2"
    t.string   "pi3comments",                      :limit => 800
    t.string   "pi3comments2",                     :limit => 800
    t.integer  "pi3completeStatus"
    t.integer  "pi3completeStatus2"
    t.string   "pi4comments",                      :limit => 800
    t.string   "pi4comments2",                     :limit => 800
    t.integer  "pi4completeStatus"
    t.integer  "pi4completeStatus2"
    t.integer  "RChildId",                                         :null => false
    t.integer  "ReassignInterviewer"
    t.string   "ReceivedBFormT2",                  :limit => 100
    t.string   "Relationship",                     :limit => 100
    t.integer  "RepeatingPreK"
    t.string   "RPhase2Comments",                  :limit => 1000
    t.integer  "scgs1"
    t.integer  "scgs10"
    t.integer  "scgs11"
    t.integer  "scgs12"
    t.integer  "scgs13"
    t.integer  "scgs14"
    t.integer  "scgs2"
    t.integer  "scgs3"
    t.integer  "scgs4"
    t.integer  "scgs5"
    t.integer  "scgs6"
    t.integer  "scgs7"
    t.integer  "scgs8"
    t.integer  "scgs9"
    t.integer  "SchoolId"
    t.string   "SchoolId2",                        :limit => 10
    t.string   "SchoolId3",                        :limit => 10
    t.string   "SchoolId4",                        :limit => 10
    t.string   "SchoolId5",                        :limit => 10
    t.string   "SchoolIdT2",                       :limit => 30
    t.string   "SchoolIdT3",                       :limit => 30
    t.string   "SchoolIdT4",                       :limit => 30
    t.string   "SchoolReleaseFormT2",              :limit => 100
    t.string   "State",                            :limit => 10
    t.string   "State2",                           :limit => 10
    t.string   "State3",                           :limit => 10
    t.string   "State4",                           :limit => 10
    t.string   "State5",                           :limit => 10
    t.string   "StillNeeds",                       :limit => 222
    t.string   "T2PIOpt1F",                        :limit => 510
    t.string   "T2PIOpt1M",                        :limit => 510
    t.string   "T2PIOpt1R",                        :limit => 510
    t.string   "T2PIOpt1S",                        :limit => 510
    t.string   "T2PIOpt1SA",                       :limit => 510
    t.string   "T2PIOpt1T",                        :limit => 510
    t.string   "T2PIOpt1W",                        :limit => 510
    t.integer  "TCLocationStatus0607"
    t.integer  "TCLocationStatus0708"
    t.string   "Teacher",                          :limit => 100
    t.string   "teacher2fn",                       :limit => 100
    t.string   "teacher2ln",                       :limit => 100
    t.string   "teacher3fn",                       :limit => 100
    t.string   "teacher3ln",                       :limit => 100
    t.string   "teacher4fn",                       :limit => 100
    t.string   "teacher4ln",                       :limit => 100
    t.string   "teacher5fn",                       :limit => 100
    t.string   "teacher5ln",                       :limit => 100
    t.integer  "teacherId2"
    t.integer  "teacherId3"
    t.integer  "teacherId4"
    t.integer  "teacherId5"
    t.integer  "TeacherReportedCaribbeanAme"
    t.string   "TeacherReportedDateEnrolled",      :limit => 100
    t.string   "TeacherReportedDateLeftSchool",    :limit => 100
    t.integer  "TeacherReportedEthnicityLat"
    t.integer  "TeacherReportedEthnicityRace"
    t.integer  "TeacherReportedGender"
    t.integer  "TeachersIdT1"
    t.integer  "TeachersIdT2"
    t.integer  "TeachersIdT3"
    t.integer  "TeachersIdT4"
    t.integer  "TracerContactInfoT1"
    t.integer  "TracerContactInfoT2"
    t.integer  "TracerContactInfoT3"
    t.integer  "TracerRosterNov"
    t.integer  "TracerRosterSep"
    t.string   "WasPaid4_1stPhoneInterview2",      :limit => 100
    t.string   "WasPaid4_2ndPhoneInterview2",      :limit => 100
    t.string   "WasPaid4_3rdPhoneInterview2",      :limit => 100
    t.string   "WasPaid4_4thPhoneInterview2",      :limit => 100
    t.integer  "weight1"
    t.string   "WhenAppPI1",                       :limit => 10
    t.string   "WhenAppPI2",                       :limit => 100
    t.string   "WhenAppPI3",                       :limit => 100
    t.string   "WhenAppPI4",                       :limit => 100
    t.string   "WhenCompleted1stPhoneInterview2",  :limit => 100
    t.string   "WhenCompleted2ndPhoneInterview2",  :limit => 100
    t.string   "WhenCompleted3rdPhoneInterview2",  :limit => 100
    t.string   "WhenCompleted4thPhoneInterview2",  :limit => 100
    t.string   "WhenCompletedPV1a",                :limit => 200
    t.string   "WhenCompletedPV2",                 :limit => 100
    t.string   "WhenCompletedPV3",                 :limit => 100
    t.string   "WhenCompletedPV4",                 :limit => 100
    t.string   "WhenReceivedBFT2",                 :limit => 100
    t.string   "WhenTeacherReportedInfoCollected", :limit => 100
    t.string   "WhoPaid_4thPhoneInterview2",       :limit => 100
    t.string   "WorkPhone1",                       :limit => 100
    t.string   "WorkPhone2",                       :limit => 100
    t.string   "WorkPhone2_1",                     :limit => 100
    t.string   "WorkPhone2_2",                     :limit => 100
    t.string   "WorkPhone3_1",                     :limit => 100
    t.string   "WorkPhone3_2",                     :limit => 100
    t.string   "YFname",                           :limit => 100
    t.string   "YLname",                           :limit => 100
    t.integer  "YokedIds"
    t.integer  "YokedPairs"
    t.integer  "YokedPairsPrimary"
    t.integer  "YokedPairsSecondary"
    t.string   "ZipCode",                          :limit => 100
    t.string   "ZipCode2",                         :limit => 100
    t.string   "ZipCode3",                         :limit => 100
    t.string   "ZipCode4",                         :limit => 100
    t.string   "ZipCode5",                         :limit => 100
    t.string   "Address3",                         :limit => 200
    t.string   "Address4",                         :limit => 200
    t.string   "Address5",                         :limit => 200
    t.integer  "AgreedToBeContactedFutStudies"
    t.string   "AgreeForm",                        :limit => 100
    t.string   "Apt",                              :limit => 50
    t.string   "Apt2",                             :limit => 50
    t.string   "Apt3",                             :limit => 50
    t.string   "Apt4",                             :limit => 50
    t.string   "Apt5",                             :limit => 50
    t.string   "AssignDemo",                       :limit => 200
    t.integer  "AvalVideo"
    t.string   "barriersFormsT2",                  :limit => 100
    t.integer  "BlueCardContactInfo0607"
    t.integer  "BlueCardContactInfo0708"
    t.integer  "BlueCardContactInfo0809"
    t.integer  "BlueCardDifferent0607"
    t.integer  "BlueCardDifferent0708"
    t.integer  "BlueCardDifferent0809"
    t.string   "CellPhone1",                       :limit => 100
    t.string   "CellPhone2",                       :limit => 100
    t.string   "CellPhone2_1",                     :limit => 100
    t.string   "CellPhone2_2",                     :limit => 100
    t.string   "CellPhone3_1",                     :limit => 100
    t.string   "CellPhone3_2",                     :limit => 100
    t.string   "changeAdd1Date",                   :limit => 100
    t.string   "changeAdd2Date",                   :limit => 100
    t.string   "changeAdd3Date",                   :limit => 100
    t.string   "changeAdd4Date",                   :limit => 100
    t.string   "changeSchoolInfo1",                :limit => 100
    t.string   "changeSchoolInfo2",                :limit => 100
    t.string   "changeSchoolInfo3",                :limit => 100
    t.string   "changeSchoolInfo4",                :limit => 100
    t.string   "changeteacherInfo1",               :limit => 100
    t.string   "changeteacherInfo2",               :limit => 100
    t.string   "changeteacherInfo3",               :limit => 100
    t.string   "changeteacherInfo4",               :limit => 100
    t.string   "ChildDOB",                         :limit => 100
    t.string   "ChildEth",                         :limit => 100
    t.string   "ChildEth2",                        :limit => 100
    t.string   "ChildEth3",                        :limit => 100
    t.string   "ChildEthOE",                       :limit => 200
    t.string   "ChildFN",                          :limit => 140
    t.integer  "ChildGender"
    t.integer  "ChildId"
    t.string   "ChildLN",                          :limit => 140
    t.string   "City",                             :limit => 10
    t.string   "City2",                            :limit => 50
    t.string   "City3",                            :limit => 50
    t.string   "City4",                            :limit => 50
    t.string   "City5",                            :limit => 50
    t.integer  "Class"
    t.string   "ClassId",                          :limit => 20
    t.string   "CLatino",                          :limit => 100
    t.integer  "cohort"
    t.string   "Comments",                         :limit => 2800
    t.string   "CommentsNewTracingInfo",           :limit => 500
    t.string   "Completed1stPhoneInterview2",      :limit => 10
    t.string   "Completed2ndPhoneInterview2",      :limit => 10
    t.string   "Completed3rdPhoneInterview2",      :limit => 10
    t.string   "Completed4thPhoneInterview2",      :limit => 10
    t.string   "CompletedPV1",                     :limit => 200
    t.string   "CompletedPV2",                     :limit => 100
    t.string   "CompletedPV3",                     :limit => 100
    t.string   "CompletedPV4",                     :limit => 100
    t.datetime "ConsentedDate"
    t.string   "ConsentFN",                        :limit => 100
    t.string   "ConsentLN",                        :limit => 100
    t.integer  "ConsentRel"
    t.integer  "ConsentStatusPhase1"
    t.integer  "ConsentStatusPhase2"
    t.integer  "ConsentStatusPhase3"
    t.string   "contactChangeComments1",           :limit => 1000
    t.string   "contactChangeComments2",           :limit => 1000
  end

  create_table "tbl_T_phone", :id => false, :force => true do |t|
    t.integer  "BCPhoneNum",                    :null => false
    t.integer  "ChildId",                       :null => false
    t.string   "comments",      :limit => 2000
    t.string   "dateCollected", :limit => 30
    t.string   "FCellPhonea",   :limit => 40
    t.string   "FCellPhoneb",   :limit => 40
    t.string   "FHomePhone",    :limit => 40
    t.string   "fname",         :limit => 30
    t.string   "FWPhonea",      :limit => 40
    t.string   "FWPhoneb",      :limit => 40
    t.string   "lname",         :limit => 30
    t.datetime "now"
    t.integer  "RChildId"
    t.integer  "TimePoint"
  end

  create_table "transferAdd", :id => false, :force => true do |t|
    t.string   "apartment",    :limit => 100
    t.string   "city",         :limit => 100
    t.datetime "collected_on"
    t.string   "comments",     :limit => 1000
    t.datetime "created_on"
    t.integer  "RChildId"
    t.string   "state",        :limit => 100
    t.string   "street",       :limit => 510
    t.string   "zip_code",     :limit => 100
  end

  create_table "transferData2", :id => false, :force => true do |t|
    t.string   "apartment",    :limit => 100
    t.integer  "caregiver_id"
    t.string   "city",         :limit => 100
    t.datetime "collected_on"
    t.string   "comments",     :limit => 1000
    t.datetime "created_on"
    t.string   "state",        :limit => 100
    t.string   "street",       :limit => 510
    t.string   "zip_code",     :limit => 100
  end

  create_table "users", :force => true do |t|
    t.string   "access_level"
    t.datetime "created_at"
    t.string   "crypted_password",          :limit => 40
    t.string   "email"
    t.string   "login"
    t.string   "name"
    t.string   "remember_token"
    t.datetime "remember_token_expires_at"
    t.string   "salt",                      :limit => 40
    t.integer  "send_withdraw_email"
    t.datetime "updated_at"
  end

  create_table "vFromC1C2", :id => false, :force => true do |t|
    t.string  "birthday",              :limit => 100
    t.integer "child_id"
    t.integer "cohort"
    t.string  "comments",              :limit => 2800
    t.string  "dt",                    :limit => 200
    t.string  "first_name",            :limit => 140
    t.string  "gender",                :limit => 1
    t.string  "hispanic",              :limit => 100
    t.integer "is_primary"
    t.string  "last_name",             :limit => 140
    t.integer "secondary_yoked_child"
    t.integer "yoked_pair"
  end

  create_table "variables", :id => false, :force => true do |t|
    t.string "format",    :limit => 49
    t.string "idxusage",  :limit => 9
    t.string "informat",  :limit => 49
    t.string "label",     :limit => 256
    t.float  "length"
    t.string "libname",   :limit => 8
    t.string "memname",   :limit => 32
    t.string "memtype",   :limit => 8
    t.string "name",      :limit => 32
    t.string "notnull",   :limit => 3
    t.float  "npos"
    t.float  "precision"
    t.float  "scale"
    t.float  "sortedby"
    t.string "transcode", :limit => 3
    t.string "type",      :limit => 4
    t.float  "varnum"
    t.string "xtype",     :limit => 12
  end

end
