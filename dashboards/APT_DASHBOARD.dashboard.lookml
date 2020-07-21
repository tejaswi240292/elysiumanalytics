- dashboard: apt_dashboard
  title: APT DASHBOARD
  layout: newspaper
  elements:
  - title: Sysmon Data
    name: Sysmon Data
    model: odm
    explore: sysmon_odm
    type: table
    fields: [sysmon_odm.src_user_name, sysmon_odm.src_ip, sysmon_odm.parent_image_name]
    filters: {}
    sorts: [sysmon_odm.src_user_name]
    limit: 500
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    limit_displayed_rows: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    series_types: {}
    transpose: false
    truncate_text: true
    size_to_fit: true
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    listen:
      Sourceip: sysmon_odm.src_ip
      Date: sysmon_odm.event_time_date
    row: 7
    col: 0
    width: 9
    height: 12
  - title: Aggregates/profiles
    name: Aggregates/profiles
    model: itd
    explore: heatmaptest
    type: table
    fields: [heatmaptest.event_time_hour, heatmaptest.dwnld_bytes, heatmaptest.email_size,
      heatmaptest.failedlogin_count, heatmaptest.fileactivity_count, heatmaptest.if_dwnld_count,
      heatmaptest.if_upld_count, heatmaptest.logins_count, heatmaptest.pri_count,
      heatmaptest.ps_count, heatmaptest.upld_bytes]
    filters: {}
    sorts: [heatmaptest.event_time_hour]
    limit: 500
    column_limit: 50
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: transparent
    limit_displayed_rows: false
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    conditional_formatting: [{type: not equal to, value: 0, background_color: "#72D16D",
        font_color: !!null '', color_application: {collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7,
          palette_id: 1e4d66b9-f066-4c33-b0b7-cc10b4810688, options: {constraints: {
              min: {type: minimum}, mid: {type: number, value: 0}, max: {type: maximum}},
            mirror: true, reverse: false, stepped: false}}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}, {type: equal to, value: 0, background_color: '',
        font_color: !!null '', color_application: {collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7,
          palette_id: 1e4d66b9-f066-4c33-b0b7-cc10b4810688, options: {constraints: {
              min: {type: minimum}, mid: {type: number, value: 0}, max: {type: maximum}},
            mirror: true, reverse: false, stepped: false}}, bold: true, italic: false,
        strikethrough: false, fields: !!null ''}]
    defaults_version: 1
    series_types: {}
    transpose: false
    truncate_text: true
    size_to_fit: true
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    listen:
      Sourceip: heatmaptest.name
      Date: heatmaptest.event_time_date
    row: 19
    col: 0
    width: 24
    height: 7
  - title: Untitled
    name: Untitled
    model: alerts
    explore: alerts_view
    type: table
    fields: [alerts_view.event_time_date, alerts_view.src_ip, alerts_view.src_username]
    filters:
      alerts_view.datefilter: 7 days
    sorts: [alerts_view.event_time_date desc]
    limit: 500
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    transpose: false
    truncate_text: true
    size_to_fit: true
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
    show_null_points: true
    listen:
      Date: alerts_view.event_time_date
    row: 0
    col: 0
    width: 13
    height: 7
  - title: Risk Event
    name: Risk Event
    model: itd
    explore: wgevent_test
    type: table
    fields: [wgevent_test.user_name, wgevent_test.event_time_minute, wgevent_test.count,
      wgevent_test.ip_src_addr]
    filters:
      wgevent_test.leef_msgid: 0F010015
    limit: 500
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    limit_displayed_rows: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    listen:
      Date: wgevent_test.event_time_date
    row: 0
    col: 13
    width: 11
    height: 7
  - title: timeline
    name: timeline
    model: itd
    explore: timeline
    type: serp
    fields: [timeline.start_time_hour, timeline.end_time_hour, timeline.dst_count,
      timeline.dst_name, timeline.sourceip]
    filters:
      timeline.dst_count: "<=5"
      timeline.start_time_hour: 2020/05/18
    sorts: [timeline.end_time_hour desc]
    limit: 500
    query_timezone: America/Los_Angeles
    hidden_fields: []
    hidden_points_if_no: []
    series_labels: {}
    show_view_names: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 0
    series_types: {}
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    listen:
      Sourceip: timeline.sourceip
    row: 7
    col: 9
    width: 15
    height: 12
  filters:
  - name: Sourceip
    title: Sourceip
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    model: itd
    explore: timeline
    listens_to_filters: []
    field: timeline.sourceip
  - name: Date
    title: Date
    type: date_filter
    default_value: 2020/05/18
    allow_multiple_values: true
    required: false
