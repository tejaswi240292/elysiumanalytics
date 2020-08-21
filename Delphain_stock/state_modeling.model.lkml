connection: "sql_server"

include: "/Delphain_view/state_data/*.view.lkml"



explore: get_state_count  {}

explore: get_state_details  {
  join: get_state_count {
    sql_on: ${get_state_count.symbol}=${get_state_details.symbol}
    and ${get_state_count.from_tran}=${get_state_details.curr_state}
     ;;
    type: left_outer
    relationship: many_to_one
  }

  }

explore: get_user_dashboard_data {
}

explore: get_avg_days_percent {
}

explore: get_current_state  {
}

explore: get_state_analysis {
}

explore: get_state_analysis_1 {
}


explore: get_state_graph{
}

explore: get_OHLC_data {

}

explore: get_OHLCA_data {
  join: get_state_analysis_1 {
    sql_on: ${get_OHLCA_data.Symbol}=${get_state_analysis_1.Symbol};;
    type: left_outer
    relationship: many_to_one
  }

}
