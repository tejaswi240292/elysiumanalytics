view: storage {
  derived_table: {
    sql: select to_timestamp(substr(CURRENT_TS, 5, 25),'MON dd hh:mi:ss UTC yyyy') AS CURRENT_TS,SOURCE_NAME,
      case when PARSED_DATA_USAGE ilike ('%K') then coalesce(split(PARSED_DATA_USAGE,' ')[0],0)*1000
      when PARSED_DATA_USAGE ilike ('%M') then coalesce(split(PARSED_DATA_USAGE,' ')[0],0)*1000000
      when PARSED_DATA_USAGE ilike ('%G') then coalesce(split(PARSED_DATA_USAGE,' ')[0],0)*1000000000
      when PARSED_DATA_USAGE ilike ('%T') then coalesce(split(PARSED_DATA_USAGE,' ')[0],0)*1000000000000
      when PARSED_DATA_USAGE ilike ('%B') then coalesce(split(PARSED_DATA_USAGE,' ')[0],0)*1
      end as  PARSED_DATA_USAGE,
      case when RAW_DATA_USAGE ilike ('%K') then coalesce(split(RAW_DATA_USAGE,' ')[0],0)  *1000
      when RAW_DATA_USAGE ilike ('%M') then coalesce(split(RAW_DATA_USAGE,' ')[0],0)  *1000000
      when RAW_DATA_USAGE ilike ('%G') then coalesce(split(RAW_DATA_USAGE,' ')[0],0)  *1000000000
      when RAW_DATA_USAGE ilike ('%T') then coalesce(split(RAW_DATA_USAGE,' ')[0],0)  *1000000000000
      when RAW_DATA_USAGE ilike ('%B') then coalesce(split(RAW_DATA_USAGE,' ')[0],0)  *1 end as  RAW_DATA_USAGE,
      case when SNOWFLAKE_RAW_TBL_USAGE ilike ('%K') then coalesce(split(SNOWFLAKE_RAW_TBL_USAGE,' ')[0],0)*1000
      when SNOWFLAKE_RAW_TBL_USAGE ilike ('%M') then coalesce(split(SNOWFLAKE_RAW_TBL_USAGE,' ')[0],0)*1000000
      when SNOWFLAKE_RAW_TBL_USAGE ilike ('%G') then coalesce(split(SNOWFLAKE_RAW_TBL_USAGE,' ')[0],0)*1000000000
      when SNOWFLAKE_RAW_TBL_USAGE ilike ('%T') then coalesce(split(SNOWFLAKE_RAW_TBL_USAGE,' ')[0],0)*1000000000000
      when SNOWFLAKE_RAW_TBL_USAGE in ('B') then 0
      when SNOWFLAKE_RAW_TBL_USAGE ilike ('%B') then coalesce(split(SNOWFLAKE_RAW_TBL_USAGE,' ')[0],0)*1  end as  SNOWFLAKE_RAW_TBL_USAGE

      from STORAGE_USAGE
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension_group: current_ts {
    type: time
    sql: ${TABLE}."CURRENT_TS" ;;
  }

  dimension: source_name {
    type: string
    sql: ${TABLE}."SOURCE_NAME" ;;
  }

  dimension: parsed_data_usage {
    type: number
    sql: ${TABLE}."PARSED_DATA_USAGE" ;;
  }

  dimension: raw_data_usage {
    type: number
    sql: ${TABLE}."RAW_DATA_USAGE" ;;
  }

  dimension: snowflake_raw_tbl_usage {
    type: number
    sql: ${TABLE}."SNOWFLAKE_RAW_TBL_USAGE" ;;
  }

  set: detail {
    fields: [current_ts_time, source_name, parsed_data_usage, raw_data_usage, snowflake_raw_tbl_usage]
  }
}
