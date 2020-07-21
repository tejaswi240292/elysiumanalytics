view: ueba_bandwidth_usage_bycount {
  derived_table: {
    sql: select event_start_date::date as event_date,name as id,type,coalesce(feature_agg:if_upld_count,0) ::bigint isupload,
      coalesce(feature_agg:if_dwnld_count,0) ::bigint isdownload,round(pas) as score,pas_algorithm::string as pas_algorithm,
      case when pas between 80.0 and 100.0 then 3
            when pas between 60.0 and 79.9  then 2
            when pas between 40.0 and 59.9 then 1
            else 0 end as level
      from UEBA_BANDWIDTH_USAGE_BY_COUNT where {% condition datefilter %} event_start_date {% endcondition %}
       ;;

  }

  filter: datefilter {
    type: date
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: event_date {
    type: date
    sql: ${TABLE}."EVENT_DATE" ;;
  }

  dimension: id {
    type: string
    sql: ${TABLE}."ID" ;;
  }
measure: Count_of_id{
  type: count_distinct
  sql: ${id} ;;
  drill_fields: [detail*]
}
  dimension: type {
    type: string
    sql: ${TABLE}."TYPE" ;;
  }

  dimension: isupload {
    type: number
    sql: ${TABLE}."ISUPLOAD" ;;
     }

  dimension: isdownload {
    type: number
    sql: ${TABLE}."ISDOWNLOAD" ;;
  }

  dimension: score {
    type: number
    sql: ${TABLE}."SCORE" ;;
      }

  dimension: pas_algorithm {
    type: string
    sql: ${TABLE}."PAS_ALGORITHM" ;;
  }

  dimension: level {
    type: number
    sql: ${TABLE}."LEVEL" ;;
  }

  dimension: isdownload_and_name {
    type: number
    sql: ${isdownload};;
    html:<b><font color='white' {{linked_value}} || {{id._rendered_value}}</font></b>;;
    link: {
      label: "Details"
      url: "
      /explore/odm/wgtraffic_odm?fields=wgtraffic_odm.event_time_time,sum_of_in_bytes,sum_of_out_bytes,wgtraffic_odm.src_user_name&f[wgtraffic_odm.event_time_date]={{event_date._value}}&f[wgtraffic_odm.src_user_name]={{id._value}}&sorts=count_of_out_bytes+desc&limit=500&query_timezone=America%2FLos_Angeles&vis=%7B%22show_view_names%22%3Afalse%2C%22show_row_numbers%22%3Atrue%2C%22transpose%22%3Afalse%2C%22truncate_text%22%3Atrue%2C%22hide_totals%22%3Afalse%2C%22hide_row_totals%22%3Afalse%2C%22size_to_fit%22%3Atrue%2C%22table_theme%22%3A%22white%22%2C%22limit_displayed_rows%22%3Afalse%2C%22enable_conditional_formatting%22%3Afalse%2C%22header_text_alignment%22%3A%22left%22%2C%22header_font_size%22%3A%2212%22%2C%22rows_font_size%22%3A%2212%22%2C%22conditional_formatting_include_totals%22%3Afalse%2C%22conditional_formatting_include_nulls%22%3Afalse%2C%22show_sql_query_menu_options%22%3Afalse%2C%22show_totals%22%3Atrue%2C%22show_row_totals%22%3Atrue%2C%22series_labels%22%3A%7B%22wgtraffic_odm.event_time_time%22%3A%22Event+Time%22%2C%22wgtraffic_odm.in_bytes%22%3A%22Received+Bytes%22%2C%22wgtraffic_odm.out_bytes%22%3A%22Sent+Bytes%22%2C%22count_of_in_bytes%22%3A%22Is+download%22%2C%22count_of_out_bytes%22%3A%22Is+upload%22%2C%22sum_of_in_bytes%22%3A%22Is+Download%22%2C%22sum_of_out_bytes%22%3A%22Is+Upload%22%7D%2C%22series_cell_visualizations%22%3A%7B%22count_of_in_bytes%22%3A%7B%22is_active%22%3Afalse%7D%7D%2C%22type%22%3A%22looker_grid%22%2C%22x_axis_gridlines%22%3Afalse%2C%22y_axis_gridlines%22%3Atrue%2C%22show_y_axis_labels%22%3Atrue%2C%22show_y_axis_ticks%22%3Atrue%2C%22y_axis_tick_density%22%3A%22default%22%2C%22y_axis_tick_density_custom%22%3A5%2C%22show_x_axis_label%22%3Atrue%2C%22show_x_axis_ticks%22%3Atrue%2C%22y_axis_scale_mode%22%3A%22linear%22%2C%22x_axis_reversed%22%3Afalse%2C%22y_axis_reversed%22%3Afalse%2C%22plot_size_by_field%22%3Afalse%2C%22trellis%22%3A%22%22%2C%22stacking%22%3A%22%22%2C%22legend_position%22%3A%22center%22%2C%22point_style%22%3A%22none%22%2C%22show_value_labels%22%3Afalse%2C%22label_density%22%3A25%2C%22x_axis_scale%22%3A%22auto%22%2C%22y_axis_combined%22%3Atrue%2C%22show_null_points%22%3Atrue%2C%22interpolation%22%3A%22linear%22%2C%22defaults_version%22%3A1%2C%22series_types%22%3A%7B%7D%7D&filter_config=%7B%22wgtraffic_odm.event_time_date%22%3A%5B%7B%22type%22%3A%22on%22%2C%22values%22%3A%5B%7B%22date%22%3A%222020-06-11T17%3A25%3A27.064Z%22%2C%22unit%22%3A%22day%22%2C%22tz%22%3Atrue%2C%22constant%22%3A%227%22%7D%5D%2C%22id%22%3A0%2C%22error%22%3Afalse%7D%5D%2C%22wgtraffic_odm.src_user_name%22%3A%5B%7B%22type%22%3A%22%3D%22%2C%22values%22%3A%5B%7B%22constant%22%3A%22akhil.polamarasetty%22%7D%2C%7B%7D%5D%2C%22id%22%3A5%2C%22error%22%3Afalse%7D%5D%7D&dynamic_fields=%5B%7B%22measure%22%3A%22count_of_out_bytes%22%2C%22based_on%22%3A%22wgtraffic_odm.out_bytes%22%2C%22expression%22%3A%22%22%2C%22label%22%3A%22Count+of+Out+Bytes%22%2C%22type%22%3A%22count_distinct%22%2C%22_kind_hint%22%3A%22measure%22%2C%22_type_hint%22%3A%22number%22%7D%2C%7B%22measure%22%3A%22count_of_in_bytes%22%2C%22based_on%22%3A%22wgtraffic_odm.in_bytes%22%2C%22expression%22%3A%22%22%2C%22label%22%3A%22Count+of+In+Bytes%22%2C%22type%22%3A%22count_distinct%22%2C%22_kind_hint%22%3A%22measure%22%2C%22_type_hint%22%3A%22number%22%7D%2C%7B%22measure%22%3A%22sum_of_in_bytes%22%2C%22based_on%22%3A%22wgtraffic_odm.in_bytes%22%2C%22expression%22%3A%22%22%2C%22label%22%3A%22Sum+of+In+Bytes%22%2C%22type%22%3A%22sum%22%2C%22_kind_hint%22%3A%22measure%22%2C%22_type_hint%22%3A%22number%22%7D%2C%7B%22measure%22%3A%22sum_of_out_bytes%22%2C%22based_on%22%3A%22wgtraffic_odm.out_bytes%22%2C%22expression%22%3A%22%22%2C%22label%22%3A%22Sum+of+Out+Bytes%22%2C%22type%22%3A%22sum%22%2C%22_kind_hint%22%3A%22measure%22%2C%22_type_hint%22%3A%22number%22%7D%5D&origin=share-expanded"
    }
  }

  set: detail {
    fields: [
      event_date,
      id,
      type,
      isupload,
      isdownload,
      score,
      pas_algorithm,
      level
    ]
  }
}
