connection: "snowfalkedb"

include: "/itd_views/*.view.lkml"
include: "/dashboards/*.dashboard.lookml"

access_grant: advanced_explore_access {
  allowed_values: ["advanced"]
  user_attribute: explore_access
}


datagroup: itd_data {
  max_cache_age: "24 hours"
#   sql_trigger: SELECT max(event_time) FROM table(FN_ML_OVERALL_AGG('analyst1')) ;;
}

explore: itd_high_risk_score {
  persist_with: itd_data
}
datagroup:fn_ml_msexchange_data{
  max_cache_age: "24 hours"
#   sql_trigger: SELECT max(event_date) FROM table(Fn_ml_analyst_fb('msexchange', 'analyst1', 'both'))  ;;
}
datagroup:fn_ml_wgtraffic_data{
  max_cache_age: "24 hours"
#   sql_trigger: SELECT max(event_date) FROM TABLE(Fn_ml_analyst_fb('wgtraffic', 'analyst1', 'both'))  ;;
}
datagroup:fn_ml_windowsnxlog_data{
  max_cache_age: "24 hours"
#   sql_trigger: SELECT max(event_date) FROM TABLE(Fn_ml_analyst_fb('windowsnxlog', 'analyst1', 'both')) ;;
}
datagroup: sysmon_batch_data{
  max_cache_age: "24 hours"
#   sql_trigger: SELECT max(event_time) FROM sysmon_batch  ;;
}
datagroup: vw_msexchange_event_zd_data{
  max_cache_age: "24 hours"
#   sql_trigger: SELECT max(event_time) FROM vw_msexchange_event_zd ;;
}
datagroup: VW_PROFILE_ALERT_EVENTS_CORRECTED_data{
  max_cache_age: "24 hours"
#   sql_trigger: SELECT max(event_time) FROM VW_PROFILE_ALERT_EVENTS_CORRECTED ;;
}
datagroup: vw_wgtraffic_event_zd_data{
  max_cache_age: "24 hours"
#   sql_trigger: SELECT max(event_time) FROM vw_wgtraffic_event_zd  ;;
}
datagroup: vw_windowsnxlog_event_zd_data{
  max_cache_age: "24 hours"
#   sql_trigger: SELECT max(event_time) FROM vw_windowsnxlog_event_zd   ;;
}
datagroup: watchguard_sessions_data{
  max_cache_age: "24 hours"
#   sql_trigger: SELECT max(session_start_datetime) FROM watchguard_sessions   ;;
}
datagroup: wgevent_batch_data{
  max_cache_age: "24 hours"
#   sql_trigger: SELECT max(session_start_datetime) FROM wgevent_batch  ;;
}
datagroup: WH_USAGE_REPORT_data{
  max_cache_age: "24 hours"
#   sql_trigger: SELECT max(session_start_datetime) FROM WH_USAGE_REPORT ;;
}
datagroup:ml_alerts_data{
  max_cache_age: "24 hours"
#   sql_trigger: SELECT max(event_date) FROM ml_alerts   ;;
}
datagroup:win_agg {
  max_cache_age: "24 hours"
#   sql_trigger:select max(event_time) from windows_agg  ;;
}

datagroup:view360 {
  max_cache_age: "24 hours"
#   sql_trigger:select max(event_time1) from view360ip   ;;
}
explore: fn_ml_msexchange {
  persist_with: fn_ml_msexchange_data
}
explore: fn_ml_wgtraffic {
  persist_with: fn_ml_wgtraffic_data
}
explore: fn_ml_windowsnxlog{
  persist_with: fn_ml_windowsnxlog_data
}

datagroup:itd_360view_data{
  max_cache_age: "24 hours"
#   sql_trigger: SELECT max(event_time1) FROM view360ip ;;
}


explore: itd_360view {
  persist_with: itd_360view_data
}

datagroup:session_track {
  max_cache_age: "24 hours"
#   sql_trigger: SELECT max(event_date) FROM tenant5.enriched.session_tracking_validation ;;
}
datagroup: iisodm {
max_cache_age: "24 hours"
# sql_trigger:select max(session_end) from iis_odm;;
}

explore: domaintest180 {
  persist_with: view360
}
explore: heatmaptest {
  persist_with: win_agg
}
explore: networktest {
  persist_with: session_track
}

explore: timeline {
  persist_with: view360
}
explore: vw_msexchange_event_zd {
  persist_with: vw_msexchange_event_zd_data
}
explore: vw_profile_alert_events_corrected {
  persist_with: VW_PROFILE_ALERT_EVENTS_CORRECTED_data
}
explore: vw_wgtraffic_event_zd {
  persist_with: vw_wgtraffic_event_zd_data
}
explore: vw_windowsnxlog_event_zd {
  persist_with: vw_windowsnxlog_event_zd_data
}
explore: watchguard_sessions {
  persist_with: watchguard_sessions_data
}
explore: wgevent_test {
  persist_with: wgevent_batch_data
}
explore: wh_usage_report {
  persist_with: WH_USAGE_REPORT_data
}
explore: iis_active {
  persist_with: iisodm
}
explore: iis_active2 {
  persist_with: iisodm
}
explore: dataview {
  persist_for: "30 minutes"
}
explore: symantecendpoint_union_ad_host {
  persist_for: "2 hours"
}
explore: itd_anomoly_user_entity {
  persist_for: "12 hours"
}
explore: ml_alerts {
  persist_with: ml_alerts_data
}

explore: alerts_view {
  persist_for: "2 hours"
}
explore: dataview_odm {
  persist_for: "30 minutes"
}

explore:  sparkline{

}
