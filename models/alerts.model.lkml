connection: "snowfalkedb"

include: "/agg_views/alert_views/*.view.lkml"

datagroup:alert_view_data
{
  max_cache_age:"2 hours"
#   sql_trigger:select max(event_time) from vw_profile_alert_events_corrected;;
}

explore: alerts_view {
  persist_with: alert_view_data
}
