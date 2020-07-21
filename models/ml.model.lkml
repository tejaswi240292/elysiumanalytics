connection: "snowfalkedb"

include: "/ml_views/*.view.lkml"



datagroup: msexchange_ml{
  max_cache_age: "24 hours"
#   sql_trigger: SELECT max(event_time) FROM msexchange_mlscore_batch ;;
}

datagroup: wgtraffic_ml {
  max_cache_age: "24 hours"
#   sql_trigger: SELECT max(event_time) FROM wgtraffic_ml_score_batch ;;
}


datagroup: windowsnxlog_ml {
  max_cache_age: "24 hours"
#   sql_trigger: SELECT max(event_time) FROM windowsnxlog_ml_score_batch ;;
}



explore: msexchange_mlscore_batch {
  persist_with: msexchange_ml
}
explore: wgtraffic_ml_score_batch {
  persist_with: wgtraffic_ml
}
explore: windowsnxlog_ml_score_batch {
  persist_with: windowsnxlog_ml
}

explore: beaconing_mlresult {
  persist_for: "24 hours"
}
