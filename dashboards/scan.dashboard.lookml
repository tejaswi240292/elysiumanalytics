- dashboard: mobilelaptopdesktop_device_malwarescan
  title: Mobile/Laptop/Desktop Device MalwareScan
  layout: newspaper
  elements:
  - title: End points on the Network and Anti-malware Scan Status
    name: End points on the Network and Anti-malware Scan Status
    model: itd
    explore: symantecendpoint_union_ad_host
    type: table
    fields: [symantecendpoint_union_ad_host.host, symantecendpoint_union_ad_host.statusd,
      symantecendpoint_union_ad_host.src_name]
    filters:
      symantecendpoint_union_ad_host.event_time_date: 7 days
    sorts: [symantecendpoint_union_ad_host.host]
    limit: 500
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: transparent
    limit_displayed_rows: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    transpose: false
    truncate_text: true
    size_to_fit: true
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    series_labels:
      symantecendpoint_union_ad_host.host: Host Name
      symantecendpoint_union_ad_host.statusd: Status Description
      symantecendpoint_union_ad_host.src_name: Source Name
    series_types: {}
    defaults_version: 1
    listen:
      Event Date: symantecendpoint_union_ad_host.event_time_minute
      Hostname: symantecendpoint_union_ad_host.host
    row: 2
    col: 0
    width: 14
    height: 5
  - title: Fractions of Hosts in Various States
    name: Fractions of Hosts in Various States
    model: itd
    explore: symantecendpoint_union_ad_host
    type: looker_pie
    fields: [symantecendpoint_union_ad_host.count, symantecendpoint_union_ad_host.status]
    filters:
      symantecendpoint_union_ad_host.event_time_date: 7 days
    sorts: [symantecendpoint_union_ad_host.count desc]
    limit: 500
    value_labels: legend
    label_type: labPer
    series_types: {}
    defaults_version: 1
    listen:
      Event Date: symantecendpoint_union_ad_host.event_time_minute
      Hostname: symantecendpoint_union_ad_host.host
    row: 2
    col: 14
    width: 10
    height: 5
  - title: Summary of Malware Risk Activities
    name: Summary of Malware Risk Activities
    model: odm
    explore: symantecendpoint_odm
    type: table
    fields: [symantecendpoint_odm.event_time_minute, symantecendpoint_odm.host, symantecendpoint_odm.action,
      symantecendpoint_odm.status, symantecendpoint_odm.malware_name, symantecendpoint_odm.event_type]
    filters:
      symantecendpoint_odm.event_time_date: 7 days
      symantecendpoint_odm.event_id: '51'
    sorts: [symantecendpoint_odm.event_time_minute desc]
    limit: 500
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: transparent
    limit_displayed_rows: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    transpose: false
    truncate_text: true
    size_to_fit: true
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    series_labels:
      symantecendpoint_odm.host: Host Name
      symantecendpoint_odm.status: Action Desc
      symantecendpoint_odm.malware_name: Malware
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
    hidden_fields: [symantecendpoint_odm.event_type]
    listen:
      Event Date: symantecendpoint_odm.event_time_minute
      Hostname: symantecendpoint_odm.host
    row: 9
    col: 0
    width: 14
    height: 6
  - title: Hostname Viruses
    name: Hostname Viruses
    model: odm
    explore: symantecendpoint_odm
    type: looker_column
    fields: [symantecendpoint_odm.malware_name, symantecendpoint_odm.host, symantecendpoint_odm.count]
    pivots: [symantecendpoint_odm.host]
    filters:
      symantecendpoint_odm.event_time_date: 7 days
      symantecendpoint_odm.event_id: '51'
    sorts: [symantecendpoint_odm.malware_name desc, symantecendpoint_odm.host]
    limit: 500
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
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
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: Volume, orientation: left, series: [{axisId: symantecendpoint_odm.count,
            id: bdcawpvscn.bdelysium.internal - symantecendpoint_odm.count, name: bdcawpvscn.bdelysium.internal},
          {axisId: symantecendpoint_odm.count, id: sstechlatop575.sstech.internal
              - symantecendpoint_odm.count, name: sstechlatop575.sstech.internal}],
        showLabels: true, showValues: true, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    series_types: {}
    series_labels:
      symantecendpoint_odm.count: Volume
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    show_row_numbers: true
    transpose: false
    truncate_text: true
    size_to_fit: true
    series_cell_visualizations:
      symantecendpoint_odm.count:
        is_active: true
    table_theme: white
    enable_conditional_formatting: true
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#3EB0D5",
        font_color: !!null '', color_application: {collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7,
          palette_id: 1e4d66b9-f066-4c33-b0b7-cc10b4810688, options: {steps: 5, stepped: true,
            reverse: true}}, bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    conditional_formatting_include_totals: true
    conditional_formatting_include_nulls: false
    defaults_version: 1
    hide_totals: false
    hide_row_totals: false
    listen:
      Event Date: symantecendpoint_odm.event_time_minute
      Hostname: symantecendpoint_odm.host
    row: 9
    col: 14
    width: 10
    height: 6
  - title: Anti-Malware Software Events
    name: Anti-Malware Software Events
    model: odm
    explore: symantecendpoints_description
    type: looker_grid
    fields: [symantecendpoint_odm.event_time_minute, symantecendpoint_odm.event_type,
      symantecendpoint_odm.host, symantecendpoint_odm.event_id, symantecendpoints_description.event_name,
      symantecendpoint_odm.app_id, symantecendpoint_odm.app_value, symantecendpoint_odm.action,
      symantecendpoint_odm.malware_name, symantecendpoint_odm.omitted_file_count,
      symantecendpoint_odm.risk_count, symantecendpoint_odm.in_file_count, symantecendpoint_odm.skipped_file_count]
    filters:
      symantecendpoint_odm.event_time_date: 7 days
    sorts: [symantecendpoint_odm.event_time_minute desc]
    limit: 500
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: transparent
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    series_column_widths:
      symantecendpoint_odm.host: 217
      symantecendpoint_odm.event_time_minute: 134
    defaults_version: 1
    listen:
      Event Date: symantecendpoint_odm.event_time_minute
      Hostname: symantecendpoint_odm.host
    row: 17
    col: 0
    width: 24
    height: 10
  filters:
  - name: Event Date
    title: Event Date
    type: date_filter
    default_value: 7 days
    allow_multiple_values: true
    required: false
  - name: Hostname
    title: Hostname
    type: string_filter
    default_value: "-NULL"
    allow_multiple_values: true
    required: false
