view: ueba_highvolume_file_access {
  derived_table: {
    sql: select event_start_date::date as event_date,name as id,type,coalesce(feature_agg:bandwidth,0) ::bigint bandwidth,
      coalesce(feature_agg:high_volume_count,0) ::bigint total,round(pas) as score,pas_algorithm::string as pas_algorithm,
      case when pas between 80.0 and 100.0 then 3
            when pas between 60.0 and 79.9  then 2
            when pas between 40.0 and 59.9 then 1
            else 0 end as level
      from UEBA_HIGH_VOLUME_FILE_ACCESS where {% condition datefilter %} event_start_date {% endcondition %}
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

  dimension: bandwidth {
    type: number
    sql: ${TABLE}."BANDWIDTH" ;;
  }

  dimension: total {
    type: number
    sql: ${TABLE}."TOTAL" ;;
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

  dimension: bandwidth_and_name {
    type: number
    sql: ${bandwidth};;
    html:<b><font color='white' {{linked_value}} || {{id._rendered_value}}</font></b>;;
    link: {
      label: "Details"
      url: "{% assign first_char = id._value | slice: 0 %}
      {% if first_char  == \"1\" %}
      /explore/odm/wgtraffic_odm?fields=wgtraffic_odm.event_time_time,wgtraffic_odm.src_ip,wgtraffic_odm.in_bytes,wgtraffic_odm.out_bytes&f[wgtraffic_odm.event_time_date]={{event_date._value}}&f[wgtraffic_odm.src_ip]={{id._value}}&sorts=wgtraffic_odm.event_time_time+desc&limit=500&query_timezone=America%2FLos_Angeles&vis=%7B%22show_view_names%22%3Afalse%2C%22show_row_numbers%22%3Atrue%2C%22transpose%22%3Afalse%2C%22truncate_text%22%3Atrue%2C%22hide_totals%22%3Afalse%2C%22hide_row_totals%22%3Afalse%2C%22size_to_fit%22%3Atrue%2C%22table_theme%22%3A%22white%22%2C%22limit_displayed_rows%22%3Afalse%2C%22enable_conditional_formatting%22%3Afalse%2C%22header_text_alignment%22%3A%22left%22%2C%22header_font_size%22%3A12%2C%22rows_font_size%22%3A12%2C%22conditional_formatting_include_totals%22%3Afalse%2C%22conditional_formatting_include_nulls%22%3Afalse%2C%22type%22%3A%22looker_grid%22%2C%22x_axis_gridlines%22%3Afalse%2C%22y_axis_gridlines%22%3Atrue%2C%22show_y_axis_labels%22%3Atrue%2C%22show_y_axis_ticks%22%3Atrue%2C%22y_axis_tick_density%22%3A%22default%22%2C%22y_axis_tick_density_custom%22%3A5%2C%22show_x_axis_label%22%3Atrue%2C%22show_x_axis_ticks%22%3Atrue%2C%22y_axis_scale_mode%22%3A%22linear%22%2C%22x_axis_reversed%22%3Afalse%2C%22y_axis_reversed%22%3Afalse%2C%22plot_size_by_field%22%3Afalse%2C%22trellis%22%3A%22%22%2C%22stacking%22%3A%22%22%2C%22legend_position%22%3A%22center%22%2C%22point_style%22%3A%22none%22%2C%22show_value_labels%22%3Afalse%2C%22label_density%22%3A25%2C%22x_axis_scale%22%3A%22auto%22%2C%22y_axis_combined%22%3Atrue%2C%22show_null_points%22%3Atrue%2C%22interpolation%22%3A%22linear%22%2C%22defaults_version%22%3A1%2C%22series_types%22%3A%7B%7D%7D&filter_config=%7B%22wgtraffic_odm.event_time_date%22%3A%5B%7B%22type%22%3A%22on%22%2C%22values%22%3A%5B%7B%22date%22%3A%222020-06-09T16%3A32%3A56.956Z%22%2C%22unit%22%3A%22day%22%2C%22tz%22%3Atrue%7D%5D%2C%22id%22%3A0%2C%22error%22%3Afalse%7D%5D%2C%22wgtraffic_odm.src_ip%22%3A%5B%7B%22type%22%3A%22%3D%22%2C%22values%22%3A%5B%7B%22constant%22%3A%22192.168.25.13%22%7D%2C%7B%7D%5D%2C%22id%22%3A3%7D%5D%7D&dynamic_fields=%5B%7B%22table_calculation%22%3A%22bandwidth%22%2C%22label%22%3A%22Bandwidth%22%2C%22expression%22%3A%22%24%7Bwgtraffic_odm.in_bytes%7D+%2B+%24%7Bwgtraffic_odm.out_bytes%7D%22%2C%22value_format%22%3Anull%2C%22value_format_name%22%3Anull%2C%22_kind_hint%22%3A%22dimension%22%2C%22_type_hint%22%3A%22number%22%7D%5D&origin=share-expanded
      {% else %}
      /explore/odm/wgtraffic_odm?fields=wgtraffic_odm.event_time_time,wgtraffic_odm.src_user_name,wgtraffic_odm.in_bytes,wgtraffic_odm.out_bytes&f[wgtraffic_odm.event_time_date]={{event_date._value}}&f[wgtraffic_odm.src_user_name]={{id._value}}&sorts=wgtraffic_odm.event_time_time+desc&limit=500&query_timezone=America%2FLos_Angeles&vis=%7B%22show_view_names%22%3Afalse%2C%22show_row_numbers%22%3Atrue%2C%22transpose%22%3Afalse%2C%22truncate_text%22%3Atrue%2C%22hide_totals%22%3Afalse%2C%22hide_row_totals%22%3Afalse%2C%22size_to_fit%22%3Atrue%2C%22table_theme%22%3A%22white%22%2C%22limit_displayed_rows%22%3Afalse%2C%22enable_conditional_formatting%22%3Afalse%2C%22header_text_alignment%22%3A%22left%22%2C%22header_font_size%22%3A12%2C%22rows_font_size%22%3A12%2C%22conditional_formatting_include_totals%22%3Afalse%2C%22conditional_formatting_include_nulls%22%3Afalse%2C%22type%22%3A%22looker_grid%22%2C%22x_axis_gridlines%22%3Afalse%2C%22y_axis_gridlines%22%3Atrue%2C%22show_y_axis_labels%22%3Atrue%2C%22show_y_axis_ticks%22%3Atrue%2C%22y_axis_tick_density%22%3A%22default%22%2C%22y_axis_tick_density_custom%22%3A5%2C%22show_x_axis_label%22%3Atrue%2C%22show_x_axis_ticks%22%3Atrue%2C%22y_axis_scale_mode%22%3A%22linear%22%2C%22x_axis_reversed%22%3Afalse%2C%22y_axis_reversed%22%3Afalse%2C%22plot_size_by_field%22%3Afalse%2C%22trellis%22%3A%22%22%2C%22stacking%22%3A%22%22%2C%22legend_position%22%3A%22center%22%2C%22point_style%22%3A%22none%22%2C%22show_value_labels%22%3Afalse%2C%22label_density%22%3A25%2C%22x_axis_scale%22%3A%22auto%22%2C%22y_axis_combined%22%3Atrue%2C%22show_null_points%22%3Atrue%2C%22interpolation%22%3A%22linear%22%2C%22defaults_version%22%3A1%2C%22series_types%22%3A%7B%7D%7D&filter_config=%7B%22wgtraffic_odm.event_time_date%22%3A%5B%7B%22type%22%3A%22on%22%2C%22values%22%3A%5B%7B%22date%22%3A%222020-06-09T16%3A32%3A56.956Z%22%2C%22unit%22%3A%22day%22%2C%22tz%22%3Atrue%7D%5D%2C%22id%22%3A0%2C%22error%22%3Afalse%7D%5D%2C%22wgtraffic_odm.src_user_name%22%3A%5B%7B%22type%22%3A%22%3D%22%2C%22values%22%3A%5B%7B%22constant%22%3A%22akhil.polamarasetty%22%7D%2C%7B%7D%5D%2C%22id%22%3A1%2C%22error%22%3Afalse%7D%5D%7D&dynamic_fields=%5B%7B%22table_calculation%22%3A%22bandwidth%22%2C%22label%22%3A%22Bandwidth%22%2C%22expression%22%3A%22%24%7Bwgtraffic_odm.in_bytes%7D+%2B+%24%7Bwgtraffic_odm.out_bytes%7D%22%2C%22value_format%22%3Anull%2C%22value_format_name%22%3Anull%2C%22_kind_hint%22%3A%22dimension%22%2C%22_type_hint%22%3A%22number%22%7D%5D&origin=share-expanded
      {% endif %}"
    }
  }

  set: detail {
    fields: [
      event_date,
      id,
      type,
      bandwidth,
      total,
      score,
      pas_algorithm,
      level
    ]
  }
}
