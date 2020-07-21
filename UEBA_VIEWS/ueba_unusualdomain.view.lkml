view: ueba_unusualdomain {
  derived_table: {
    sql: select event_start_date::date as event_date,name as id,type,coalesce(feature_agg:upld_bytes,0) ::bigint upld_bytes,
      coalesce(feature_agg:distinct_domain_count,0) ::bigint distinct_domain_count,pas as score,pas_algorithm,
      case when pas between 80.0 and 100.0 then 3
            when pas between 60.0 and 79.9  then 2
            when pas between 40.0 and 59.9 then 1
            else 0 end as level
      from UEBA_UNUSUAL_DOMAIN where {% condition datefilter %} event_start_date {% endcondition %}
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

  dimension: upld_bytes {
    type: number
    sql: ${TABLE}."UPLD_BYTES" ;;
  }

  dimension: distinct_domain_count {
    type: number
    sql: ${TABLE}."DISTINCT_DOMAIN_COUNT" ;;
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

  dimension: upld_bytes_and_name {
    type: number
    sql: ${upld_bytes};;
    html:<b><font color='white' {{linked_value}} || {{id._rendered_value}}</font></b>;;
    link: {
      label: "Details"
      url: "{% assign first_char = id._value | slice: 0 %}
      {% if first_char  == \"1\" %}
      /explore/odm/wgtraffic_odm?fields=wgtraffic_odm.event_time_time,wgtraffic_odm.src_ip,list_of_dst_domain,wgtraffic_odm.out_bytes&f[wgtraffic_odm.event_time_date]=2020%2F06%2F11&f[wgtraffic_odm.event_id]=1AFF0024%2C2CFF0000&f[wgtraffic_odm.src_ip]=192.168.100.32&sorts=wgtraffic_odm.event_time_time+desc&limit=500&query_timezone=America%2FLos_Angeles&vis=%7B%22show_view_names%22%3Afalse%2C%22show_row_numbers%22%3Atrue%2C%22transpose%22%3Afalse%2C%22truncate_text%22%3Atrue%2C%22hide_totals%22%3Afalse%2C%22hide_row_totals%22%3Afalse%2C%22size_to_fit%22%3Atrue%2C%22table_theme%22%3A%22white%22%2C%22limit_displayed_rows%22%3Afalse%2C%22enable_conditional_formatting%22%3Afalse%2C%22header_text_alignment%22%3A%22left%22%2C%22header_font_size%22%3A%2212%22%2C%22rows_font_size%22%3A%2212%22%2C%22conditional_formatting_include_totals%22%3Afalse%2C%22conditional_formatting_include_nulls%22%3Afalse%2C%22show_sql_query_menu_options%22%3Afalse%2C%22show_totals%22%3Atrue%2C%22show_row_totals%22%3Atrue%2C%22series_labels%22%3A%7B%22wgtraffic_odm.count%22%3A%22Domain+Count%22%2C%22sum_of_out_bytes%22%3A%22Upload+Bytes%22%2C%22wgtraffic_odm.out_bytes%22%3A%22Upload+Bytes%22%2C%22list_of_dst_domain%22%3A%22Dst+Domain%22%7D%2C%22series_cell_visualizations%22%3A%7B%22sum_of_out_bytes%22%3A%7B%22is_active%22%3Afalse%7D%7D%2C%22series_types%22%3A%7B%7D%2C%22type%22%3A%22looker_grid%22%2C%22defaults_version%22%3A1%7D&filter_config=%7B%22wgtraffic_odm.event_time_date%22%3A%5B%7B%22type%22%3A%22on%22%2C%22values%22%3A%5B%7B%22date%22%3A%222020-06-11T20%3A03%3A33.307Z%22%2C%22unit%22%3A%22day%22%2C%22tz%22%3Atrue%2C%22constant%22%3A%227%22%7D%5D%2C%22id%22%3A0%2C%22error%22%3Afalse%7D%5D%2C%22wgtraffic_odm.event_id%22%3A%5B%7B%22type%22%3A%22%3D%22%2C%22values%22%3A%5B%7B%22constant%22%3A%221AFF0024%2C2CFF0000%22%7D%2C%7B%7D%5D%2C%22id%22%3A2%2C%22error%22%3Afalse%7D%5D%2C%22wgtraffic_odm.src_ip%22%3A%5B%7B%22type%22%3A%22%3D%22%2C%22values%22%3A%5B%7B%22constant%22%3A%22192.168.100.32%22%7D%2C%7B%7D%5D%2C%22id%22%3A4%2C%22error%22%3Afalse%7D%5D%7D&dynamic_fields=%5B%7B%22measure%22%3A%22sum_of_out_bytes%22%2C%22based_on%22%3A%22wgtraffic_odm.out_bytes%22%2C%22expression%22%3A%22%22%2C%22label%22%3A%22Sum+of+Out+Bytes%22%2C%22type%22%3A%22sum%22%2C%22_kind_hint%22%3A%22measure%22%2C%22_type_hint%22%3A%22number%22%7D%2C%7B%22measure%22%3A%22list_of_dst_domain%22%2C%22based_on%22%3A%22wgtraffic_odm.dst_domain%22%2C%22expression%22%3A%22%22%2C%22label%22%3A%22List+of+Dst+Domain%22%2C%22type%22%3A%22list%22%2C%22_kind_hint%22%3A%22measure%22%2C%22_type_hint%22%3A%22list%22%7D%5D&origin=share-expanded
      {% else %}
      /explore/odm/wgtraffic_odm?fields=wgtraffic_odm.event_time_time,wgtraffic_odm.src_user_name,list_of_dst_domain,wgtraffic_odm.out_bytes&f[wgtraffic_odm.event_time_date]=2020%2F06%2F09&f[wgtraffic_odm.src_user_name]=akhil.polamarasetty&f[wgtraffic_odm.event_id]=1AFF0024%2C2CFF0000&sorts=wgtraffic_odm.event_time_time+desc&limit=500&query_timezone=America%2FLos_Angeles&vis=%7B%22show_view_names%22%3Afalse%2C%22show_row_numbers%22%3Atrue%2C%22transpose%22%3Afalse%2C%22truncate_text%22%3Atrue%2C%22hide_totals%22%3Afalse%2C%22hide_row_totals%22%3Afalse%2C%22size_to_fit%22%3Atrue%2C%22table_theme%22%3A%22white%22%2C%22limit_displayed_rows%22%3Afalse%2C%22enable_conditional_formatting%22%3Afalse%2C%22header_text_alignment%22%3A%22left%22%2C%22header_font_size%22%3A%2212%22%2C%22rows_font_size%22%3A%2212%22%2C%22conditional_formatting_include_totals%22%3Afalse%2C%22conditional_formatting_include_nulls%22%3Afalse%2C%22show_sql_query_menu_options%22%3Afalse%2C%22show_totals%22%3Atrue%2C%22show_row_totals%22%3Atrue%2C%22series_labels%22%3A%7B%22wgtraffic_odm.count%22%3A%22Domain+Count%22%2C%22sum_of_out_bytes%22%3A%22Upload+Bytes%22%2C%22wgtraffic_odm.out_bytes%22%3A%22Upload+Bytes%22%2C%22list_of_dst_domain%22%3A%22Dst+Domain%22%7D%2C%22series_cell_visualizations%22%3A%7B%22sum_of_out_bytes%22%3A%7B%22is_active%22%3Afalse%7D%7D%2C%22series_types%22%3A%7B%7D%2C%22type%22%3A%22looker_grid%22%2C%22defaults_version%22%3A1%7D&filter_config=%7B%22wgtraffic_odm.event_time_date%22%3A%5B%7B%22type%22%3A%22on%22%2C%22values%22%3A%5B%7B%22date%22%3A%222020-06-09T20%3A03%3A33.307Z%22%2C%22unit%22%3A%22day%22%2C%22tz%22%3Atrue%7D%5D%2C%22id%22%3A0%2C%22error%22%3Afalse%7D%5D%2C%22wgtraffic_odm.src_user_name%22%3A%5B%7B%22type%22%3A%22%3D%22%2C%22values%22%3A%5B%7B%22constant%22%3A%22akhil.polamarasetty%22%7D%2C%7B%7D%5D%2C%22id%22%3A1%2C%22error%22%3Afalse%7D%5D%2C%22wgtraffic_odm.event_id%22%3A%5B%7B%22type%22%3A%22%3D%22%2C%22values%22%3A%5B%7B%22constant%22%3A%221AFF0024%2C2CFF0000%22%7D%2C%7B%7D%5D%2C%22id%22%3A2%2C%22error%22%3Afalse%7D%5D%7D&dynamic_fields=%5B%7B%22measure%22%3A%22list_of_dst_domain%22%2C%22based_on%22%3A%22wgtraffic_odm.dst_domain%22%2C%22expression%22%3A%22%22%2C%22label%22%3A%22List+of+Dst+Domain%22%2C%22type%22%3A%22list%22%2C%22_kind_hint%22%3A%22measure%22%2C%22_type_hint%22%3A%22list%22%7D%5D&origin=share-expanded
      {% endif %}"
    }
  }

  set: detail {
    fields: [
      event_date,
      id,
      type,
      upld_bytes,
      distinct_domain_count,
      score,
      pas_algorithm,
      level
    ]
  }
}
