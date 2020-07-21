view: alerts_view {
  derived_table: {
    sql: select id,event_time,source_nm,src_username,src_ip,dst_ip,hostname,alert_type,alert_abbr_nm,alert_desc,processing_dttm,PARENT_ALERT_ID,LATITUDE,longitude,
      case when alert_type in ('UALk','ULMuH','NwESe','UA10Lk1Hh','UnPsDc','ApThNt') then '5'
           when alert_type in ('UPrAcEc','UAcNwCo','UAcNwCt') then '4'
           when alert_type in ('UAdScEnGlG','URmScEnGlG','MwDcWe','UAcMuW') then '3'
           when alert_type in ('AuLgCs','UAcNwDeP','UAcNwSoP') then '2'
           when alert_type in ('NwWnU','GlNwCt') then '1' else '3'
      end as severity from vw_profile_alert_events_corrected wHERE id = PARENT_ALERT_ID and alert_type <> 'NwPAcGl' and alert_type <> 'UAcMuW' and alert_type <> 'CpFi' and {% condition datefilter %} event_time {% endcondition %}
      union all
      select id,event_date,source_nm,name,null as src_ip,null as dst_ip,null as hostname,alert_type,alert_type,alert_type as alert_desc,null as processing_dttm,id as PARENT_ALERT_ID,'null' as LATITUDE,'null' as longitude,'5' as severity from ml_alerts where type='user' AND id = PARENT_ALERT_ID and {% condition datefilter %} event_date {% endcondition %}
      union all
      select id,event_date,source_nm,null,name as src_ip,null as dst_ip,null as hostname,alert_type,alert_type,alert_type as alert_desc,null as processing_dttm,id as PARENT_ALERT_ID,'null' as LATITUDE,'null' as longitude,'5' as severity from ml_alerts where type='entity' and id = PARENT_ALERT_ID and {% condition datefilter %} event_date {% endcondition %}
       ;;
  }

  filter: datefilter {
    type: date
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: id {
    type: string
    sql: ${TABLE}."ID" ;;
  }

  dimension_group: event_time {
    type: time
    sql: ${TABLE}."EVENT_TIME" ;;
  }

  dimension: event_date {
    type: date
    sql: ${event_time_date} ;;
  }

  dimension: source_nm {
    type: string
    sql: ${TABLE}."SOURCE_NM" ;;
  }

  dimension: src_username {
    type: string
    sql: ${TABLE}."SRC_USERNAME" ;;
  }

  dimension: src_ip {
    type: string
    sql: ${TABLE}."SRC_IP" ;;

    link: {
            label: "Details Of VPN"
            url:
            "/explore/itd/watchguard_sessions?fields=watchguard_sessions.session_end_datetime_time,watchguard_sessions.user_name,watchguard_sessions.user_type,watchguard_sessions.watchguard_host,watchguard_sessions.ip_src_addr_nat,watchguard_sessions.src_ip_geo_city,watchguard_sessions.src_ip_geo_country,watchguard_sessions.session_status,watchguard_sessions.session_end_type,watchguard_sessions.session_start_datetime_time,watchguard_sessions.deviating_distance,watchguard_sessions.count&f[watchguard_sessions.session_end_datetime_date]={{event_date._value}}&f[watchguard_sessions.ip_src_addr_nat]={{src_ip._value}}&sorts=watchguard_sessions.session_end_datetime_time+desc&limit=500&query_timezone=America%2FLos_Angeles&vis=%7B%22show_view_names%22%3Afalse%2C%22show_row_numbers%22%3Atrue%2C%22transpose%22%3Afalse%2C%22truncate_text%22%3Atrue%2C%22hide_totals%22%3Afalse%2C%22hide_row_totals%22%3Afalse%2C%22size_to_fit%22%3Atrue%2C%22table_theme%22%3A%22white%22%2C%22limit_displayed_rows%22%3Afalse%2C%22enable_conditional_formatting%22%3Afalse%2C%22header_text_alignment%22%3A%22left%22%2C%22header_font_size%22%3A%2212%22%2C%22rows_font_size%22%3A%2212%22%2C%22conditional_formatting_include_totals%22%3Afalse%2C%22conditional_formatting_include_nulls%22%3Afalse%2C%22show_sql_query_menu_options%22%3Afalse%2C%22show_totals%22%3Atrue%2C%22show_row_totals%22%3Atrue%2C%22series_labels%22%3A%7B%22watchguard_sessions.count%22%3A%22No+of+Sessions%22%7D%2C%22series_cell_visualizations%22%3A%7B%22watchguard_sessions.count%22%3A%7B%22is_active%22%3Afalse%7D%7D%2C%22type%22%3A%22looker_grid%22%2C%22x_axis_gridlines%22%3Afalse%2C%22y_axis_gridlines%22%3Atrue%2C%22show_y_axis_labels%22%3Atrue%2C%22show_y_axis_ticks%22%3Atrue%2C%22y_axis_tick_density%22%3A%22default%22%2C%22y_axis_tick_density_custom%22%3A5%2C%22show_x_axis_label%22%3Atrue%2C%22show_x_axis_ticks%22%3Atrue%2C%22y_axis_scale_mode%22%3A%22linear%22%2C%22x_axis_reversed%22%3Afalse%2C%22y_axis_reversed%22%3Afalse%2C%22plot_size_by_field%22%3Afalse%2C%22trellis%22%3A%22%22%2C%22stacking%22%3A%22%22%2C%22legend_position%22%3A%22center%22%2C%22point_style%22%3A%22none%22%2C%22show_value_labels%22%3Afalse%2C%22label_density%22%3A25%2C%22x_axis_scale%22%3A%22auto%22%2C%22y_axis_combined%22%3Atrue%2C%22show_null_points%22%3Atrue%2C%22interpolation%22%3A%22linear%22%2C%22defaults_version%22%3A1%2C%22series_types%22%3A%7B%7D%7D&filter_config=%7B%22watchguard_sessions.session_end_datetime_date%22%3A%5B%7B%22type%22%3A%22on%22%2C%22values%22%3A%5B%7B%22date%22%3A%222020-06-09T20%3A23%3A06.024Z%22%2C%22unit%22%3A%22day%22%2C%22tz%22%3Atrue%7D%5D%2C%22id%22%3A0%2C%22error%22%3Afalse%7D%5D%2C%22watchguard_sessions.user_name%22%3A%5B%7B%22type%22%3A%22%3D%22%2C%22values%22%3A%5B%7B%22constant%22%3A%22akhil.polamarasetty%22%7D%2C%7B%7D%5D%2C%22id%22%3A6%2C%22error%22%3Afalse%7D%5D%7D&dynamic_fields=%5B%5D&origin=share-expanded"
          }

  }

  dimension: dst_ip {
    type: string
    sql: ${TABLE}."DST_IP" ;;
  }

  dimension: hostname {
    type: string
    sql: ${TABLE}."HOSTNAME" ;;
  }

  dimension: alert_type {
    type: string
    sql: ${TABLE}."ALERT_TYPE" ;;
  }

  dimension: Alert_Abbreviation_Name {
    type: string
    sql: ${TABLE}."ALERT_ABBR_NM" ;;

    link:
    {
      label: "Filter By Alert Name"
      url: "/dashboards/95?alert_name={{ value }}"
    }
  }

  dimension: alert_desc {
    type: string
    sql: ${TABLE}."ALERT_DESC" ;;
  }

  dimension_group: processing_dttm {
    type: time
    sql: ${TABLE}."PROCESSING_DTTM" ;;
  }

  dimension: parent_alert_id {
    type: string
    sql: ${TABLE}."PARENT_ALERT_ID" ;;
  }

  dimension: latitude {
    type: string
    sql: ${TABLE}."LATITUDE" ;;
  }

  dimension: longitude {
    type: string
    sql: ${TABLE}."LONGITUDE" ;;
  }

  dimension: severity {
    type: string
    sql: ${TABLE}."SEVERITY" ;;

    link:
    {
      label: "Filter By Severity"
      url: "/dashboards/95?Severity={{ value }}"
    }
  }

  dimension: location {
    type: location
    sql_latitude: ${latitude} ;;
    sql_longitude: ${longitude};;
  }

  set: detail {
    fields: [
      id,
      event_time_time,
      source_nm,
      src_username,
      src_ip,
      dst_ip,
      hostname,
      alert_type,
      Alert_Abbreviation_Name,
      alert_desc,
      processing_dttm_time,
      parent_alert_id,
      latitude,
      longitude,
      severity,
      location
    ]
  }
}
