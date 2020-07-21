view: timeline {
  derived_table: {
    sql: select
        time_slice(time,1,'HOUR','START') AS start_time,
        time_slice(time,1,'HOUR','end') AS end_time,
        dst_name,
        sourceip,
        IFNULL(sum(case when type = 'dst' then 1 else 0 end),0) as dst_count
        from
      (
      select to_timestamp_ntz(event_Time1) as time,dst_name,sourceip,'dst' as type from view360ip where dst_name!='' and dst_name!='NA' and sourceip is not null
      )sst  group by start_time,end_time,dst_name,sourceip
       ;;

  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension_group: start_time {
    type: time
    sql: ${TABLE}."START_TIME" ;;
  }

  dimension_group: end_time {
    type: time
    sql: ${TABLE}."END_TIME" ;;
  }

  dimension: dst_name {
    type: string
    sql: ${TABLE}."DST_NAME" ;;
    link: {
      label: "DST NAME 180"
      url: "/explore/itd/domaintest180?fields=domaintest180.event_date,domaintest180.dst_name,sum_of_count&pivots=domaintest180.dst_name&fill_fields=domaintest180.event_date&f[domaintest180.datefilter]=180+days&f[domaintest180.dst_name]={{ value }}&sorts=domaintest180.event_date+desc,domaintest180.dst_name&limit=500&query_timezone=America%2FLos_Angeles&vis=%7B%22x_axis_gridlines%22%3Afalse%2C%22y_axis_gridlines%22%3Atrue%2C%22show_view_names%22%3Afalse%2C%22show_y_axis_labels%22%3Atrue%2C%22show_y_axis_ticks%22%3Atrue%2C%22y_axis_tick_density%22%3A%22default%22%2C%22y_axis_tick_density_custom%22%3A5%2C%22show_x_axis_label%22%3Atrue%2C%22show_x_axis_ticks%22%3Atrue%2C%22y_axis_scale_mode%22%3A%22linear%22%2C%22x_axis_reversed%22%3Afalse%2C%22y_axis_reversed%22%3Afalse%2C%22plot_size_by_field%22%3Afalse%2C%22trellis%22%3A%22%22%2C%22stacking%22%3A%22%22%2C%22limit_displayed_rows%22%3Afalse%2C%22legend_position%22%3A%22center%22%2C%22point_style%22%3A%22none%22%2C%22show_value_labels%22%3Afalse%2C%22label_density%22%3A25%2C%22x_axis_scale%22%3A%22auto%22%2C%22y_axis_combined%22%3Atrue%2C%22show_null_points%22%3Atrue%2C%22interpolation%22%3A%22linear%22%2C%22type%22%3A%22looker_line%22%2C%22ordering%22%3A%22none%22%2C%22show_null_labels%22%3Afalse%2C%22show_totals_labels%22%3Afalse%2C%22show_silhouette%22%3Afalse%2C%22totals_color%22%3A%22%23808080%22%2C%22defaults_version%22%3A1%2C%22series_types%22%3A%7B%7D%7D&filter_config=%7B%22domaintest180.datefilter%22%3A%5B%7B%22type%22%3A%22past%22%2C%22values%22%3A%5B%7B%22constant%22%3A%22180%22%2C%22unit%22%3A%22day%22%7D%2C%7B%7D%5D%2C%22id%22%3A0%2C%22error%22%3Afalse%7D%5D%2C%22domaintest180.dst_name%22%3A%5B%7B%22type%22%3A%22%3D%22%2C%22values%22%3A%5B%7B%22constant%22%3A%22gitlab.com%22%7D%2C%7B%7D%5D%2C%22id%22%3A1%2C%22error%22%3Afalse%7D%5D%7D&dynamic_fields=%5B%7B%22measure%22%3A%22sum_of_count%22%2C%22based_on%22%3A%22domaintest180.count%22%2C%22expression%22%3A%22%22%2C%22label%22%3A%22Sum+of+Count%22%2C%22type%22%3A%22sum%22%2C%22_kind_hint%22%3A%22measure%22%2C%22_type_hint%22%3A%22number%22%7D%5D&origin=share-expanded"
    }
  }

  dimension: sourceip {
    type: string
    sql: ${TABLE}."SOURCEIP" ;;
  }

  dimension: dst_count {
    type: number
    sql: ${TABLE}."DST_COUNT" ;;
  }

  set: detail {
    fields: [start_time_time, end_time_time, dst_name, sourceip, dst_count]
  }
}
