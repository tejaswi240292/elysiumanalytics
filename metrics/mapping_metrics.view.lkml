view: mapping_metrics {

  sql_table_name: mapping_metrics ;;


  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: current_ts {
    type: date
    sql: ${TABLE}."CURRENT_TS" ;;
  }

  dimension: source_name {
    type: string
    sql: ${TABLE}."SOURCE_NAME" ;;
  }

  dimension: raw_file {
    type: string
    sql: ${TABLE}."RAW_FILE" ;;
  }

  dimension: raw_file_load_time {
    type: string
    sql: ${TABLE}."RAW_FILE_LOAD_TIME" ;;
  }

  dimension: parsed_file {
    type: string
    sql: ${TABLE}."PARSED_FILE" ;;
  }

  dimension: parsed_file_load_time {
    type: string
    sql: ${TABLE}."PARSED_FILE_LOAD_TIME" ;;
  }

  dimension: count_of_recs_in_parsed_file {
    type: number
    sql: ${TABLE}."COUNT_OF_RECS_IN_PARSED_FILE" ;;
  }

  dimension: file_in_snowflake_table {
    type: string
    sql: ${TABLE}."FILE_IN_SNOWFLAKE_TABLE" ;;
  }

  dimension: count_of_recs {
    type: number
    sql: ${TABLE}."COUNT_OF_RECS" ;;
  }

  dimension: diff_in_count_of_recs {
    type: number
    sql: ${TABLE}."DIFF_IN_COUNT_OF_RECS" ;;
  }

  dimension: snowflake_file_load_time {
    type: string
    sql: ${TABLE}."SNOWFLAKE_FILE_LOAD_TIME" ;;
  }

  set: detail {
    fields: [
      current_ts,
      source_name,
      raw_file,
      raw_file_load_time,
      parsed_file,
      parsed_file_load_time,
      count_of_recs_in_parsed_file,
      file_in_snowflake_table,
      count_of_recs,
      diff_in_count_of_recs,
      snowflake_file_load_time
    ]
  }
}
