- dashboard: nist_cyber_security_framework_part_1
  title: NIST Cyber Security Framework Part 1
  layout: newspaper
  elements:
  - title: Logon Of Users
    name: Logon Of Users
    model: agg
    explore: agg_windows
    type: looker_grid
    fields: [agg_windows.type, agg_windows.count, agg_windows.date_date, agg_windows.hour,
      agg_windows.eventid, agg_windows.entity1, agg_windows.entity2]
    filters:
      agg_windows.source: --,-"Null"
      agg_windows.eventid: '4624'
    sorts: [agg_windows.date_date desc]
    limit: 500
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
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
    series_labels:
      agg_windows.type: EventName
      agg_windows.entity1: ReportingHost
      agg_windows.entity2: SourceUserId
      agg_windows.date_date: Date
    series_types: {}
    defaults_version: 1
    listen:
      Date Date: agg_windows.date_date
    row: 15
    col: 0
    width: 13
    height: 5
  - title: Resource Monitoring (High CPU Events by Device)
    name: Resource Monitoring (High CPU Events by Device)
    model: agg
    explore: agg_watchguard_proxy
    type: looker_grid
    fields: [agg_watchguard_proxy.date_date, agg_watchguard_proxy.hour, agg_watchguard_proxy.entity2,
      sum_of_count]
    filters:
      agg_watchguard_proxy.type: Msg Count
      agg_watchguard_proxy.entity2: -"Empty"
    sorts: [agg_watchguard_proxy.date_date desc]
    limit: 500
    dynamic_fields: [{measure: sum_of_count, based_on: agg_watchguard_proxy.count,
        expression: '', label: Sum of Count, type: sum, _kind_hint: measure, _type_hint: number}]
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
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
    series_labels:
      agg_watchguard_proxy.entity2: Policy
      sum_of_count: Total
      agg_watchguard_proxy.date_date: Day
    series_cell_visualizations:
      sum_of_count:
        is_active: true
    series_types: {}
    defaults_version: 1
    listen:
      Date Date: agg_watchguard_proxy.date_date
    row: 15
    col: 13
    width: 11
    height: 5
  - title: Location
    name: Location
    model: odm
    explore: wgtraffic_odm
    type: looker_map
    fields: [wgtraffic_odm.count, wgtraffic_odm.src_location]
    filters: {}
    sorts: [wgtraffic_odm.count desc]
    limit: 500
    map_plot_mode: points
    heatmap_gridlines: false
    heatmap_gridlines_empty: false
    heatmap_opacity: 0.5
    show_region_field: true
    draw_map_labels_above_data: true
    map_tile_provider: light
    map_position: fit_data
    map_scale_indicator: 'off'
    map_pannable: true
    map_zoomable: true
    map_marker_type: circle
    map_marker_icon_name: default
    map_marker_radius_mode: proportional_value
    map_marker_units: meters
    map_marker_proportional_scale_type: linear
    map_marker_color_mode: fixed
    show_view_names: false
    show_legend: true
    quantize_map_value_colors: false
    reverse_map_value_colors: false
    series_types: {}
    defaults_version: 1
    listen:
      Date Date: wgtraffic_odm.event_time_date
    row: 25
    col: 13
    width: 11
    height: 7
  - title: Remote Access
    name: Remote Access
    model: agg
    explore: agg_watchguard_proxy
    type: looker_grid
    fields: [sum_of_count, agg_watchguard_proxy.entity2, agg_watchguard_proxy.entity1]
    filters:
      agg_watchguard_proxy.entity1: '1701,1723'
    sorts: [sum_of_count desc]
    limit: 500
    dynamic_fields: [{measure: sum_of_count, based_on: agg_watchguard_proxy.count,
        expression: '', label: Sum of Count, type: sum, _kind_hint: measure, _type_hint: number}]
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    column_order: ["$$$_row_numbers_$$$", agg_watchguard_proxy.entity1, agg_watchguard_proxy.entity2,
      sum_of_count]
    show_totals: true
    show_row_totals: true
    series_labels:
      sum_of_count: Total
      agg_watchguard_proxy.entity2: Policy
      agg_watchguard_proxy.entity1: Protocol
    series_cell_visualizations:
      sum_of_count:
        is_active: true
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    x_axis_label: Date
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    legend_position: center
    series_types: {}
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    listen:
      Date Date: agg_watchguard_proxy.date_date
    row: 38
    col: 0
    width: 8
    height: 6
  - title: Remote Access(RDP User Summary)
    name: Remote Access(RDP User Summary)
    model: agg
    explore: agg_watchguard_proxy
    type: looker_grid
    fields: [sum_of_count, agg_watchguard_proxy.entity2]
    filters:
      agg_watchguard_proxy.entity1: '3389'
    sorts: [sum_of_count desc]
    limit: 500
    dynamic_fields: [{measure: sum_of_count, based_on: agg_watchguard_proxy.count,
        expression: '', label: Sum of Count, type: sum, _kind_hint: measure, _type_hint: number}]
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
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
    listen:
      Date Date: agg_watchguard_proxy.date_date
    row: 32
    col: 16
    width: 8
    height: 6
  - title: Remote Desktop Detection - Normalized Events
    name: Remote Desktop Detection - Normalized Events
    model: agg
    explore: agg_watchguard_proxy
    type: looker_grid
    fields: [sum_of_count, agg_watchguard_proxy.date_date, agg_watchguard_proxy.entity2,
      agg_watchguard_proxy.source, agg_watchguard_proxy.type]
    filters:
      agg_watchguard_proxy.type: Policy and Destination port count
      agg_watchguard_proxy.entity2: '3389'
    sorts: [agg_watchguard_proxy.date_date desc]
    limit: 500
    dynamic_fields: [{measure: sum_of_count, based_on: agg_watchguard_proxy.count,
        expression: '', label: Sum of Count, type: sum, _kind_hint: measure, _type_hint: number}]
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
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
    listen:
      Date Date: agg_watchguard_proxy.date_date
    row: 32
    col: 0
    width: 8
    height: 6
  - title: VPN  Summary - Logons from Unusual Sources
    name: VPN  Summary - Logons from Unusual Sources
    model: itd
    explore: watchguard_sessions
    type: looker_grid
    fields: [watchguard_sessions.session_end_datetime_date, watchguard_sessions.session_start_datetime_date,
      watchguard_sessions.user_type, watchguard_sessions.user_name, watchguard_sessions.session_status]
    limit: 500
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_types: {}
    defaults_version: 1
    listen:
      Date Date: watchguard_sessions.session_start_datetime_date
    row: 32
    col: 8
    width: 8
    height: 6
  - title: Continuous Monitoring ( Activity Summary)
    name: Continuous Monitoring ( Activity Summary)
    model: agg
    explore: agg_watchguard_proxy
    type: looker_grid
    fields: [agg_watchguard_proxy.date_date, agg_watchguard_proxy.entity1, sum_of_count]
    sorts: [agg_watchguard_proxy.date_date desc]
    limit: 500
    dynamic_fields: [{measure: sum_of_count, based_on: agg_watchguard_proxy.count,
        expression: '', label: Sum of Count, type: sum, _kind_hint: measure, _type_hint: number}]
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
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
    series_labels:
      sum_of_count: Total
    series_cell_visualizations:
      sum_of_count:
        is_active: true
    series_types: {}
    defaults_version: 1
    listen:
      Date Date: agg_watchguard_proxy.date_date
    row: 55
    col: 0
    width: 12
    height: 6
  - title: Clients Connecting To Servers Over Command/Control
    name: Clients Connecting To Servers Over Command/Control
    model: odm
    explore: wgtraffic_odm
    type: looker_grid
    fields: [wgtraffic_odm.dst_port, wgtraffic_odm.count, wgtraffic_odm.src_ip]
    filters:
      datefilter: 'Yes'
      wgtraffic_odm.dst_port: -Null,-"Empty"
    sorts: [wgtraffic_odm.count desc]
    limit: 500
    dynamic_fields: [{dimension: datefilter, label: DateFilter, expression: 'matches_filter(${wgtraffic_odm.event_time_date},`last
          7 days`)', value_format: !!null '', value_format_name: !!null '', _kind_hint: dimension,
        _type_hint: yesno}]
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
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
    listen:
      Date Date: wgtraffic_odm.event_time_date
    row: 71
    col: 0
    width: 8
    height: 6
  - title: Top Hosts with Most Internal Connections
    name: Top Hosts with Most Internal Connections
    model: odm
    explore: wgtraffic_odm
    type: looker_pie
    fields: [wgtraffic_odm.count, wgtraffic_odm.src_ip]
    filters:
      datefilter: 'Yes'
      wgtraffic_odm.src_ip: "-Null"
    sorts: [wgtraffic_odm.count desc]
    limit: 10
    dynamic_fields: [{dimension: datefilter, label: DateFilter, expression: 'matches_filter(${wgtraffic_odm.event_time_date},`last
          7 days`)', value_format: !!null '', value_format_name: !!null '', _kind_hint: dimension,
        _type_hint: yesno}]
    value_labels: labels
    label_type: labPer
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
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
    listen:
      Date Date: wgtraffic_odm.event_time_date
    row: 71
    col: 8
    width: 8
    height: 6
  - name: Resource Monitoring
    type: text
    title_text: Resource Monitoring
    body_text: "- **Resource Monitoring**\n- **Remote Access**\n- **Trust Relationships**\
      \ \n- **Continuous Monitoring**"
    row: 0
    col: 0
    width: 24
    height: 4
  - name: Resource Monitoring (2)
    type: text
    title_text: Resource Monitoring
    body_text: |-
      **PR.DS-4 -- Adequate capacity to ensure availability is maintained.**

      This dashboard assists the organization to monitor resource usage and utilization of servers and network assets, ensuring that maintenance of adequate availability. Excessive resource utilization may indicate a denial of service attack or may indicate that loads should be shifted to different resources or that additional capacity is required. Low utilization of resources may indicate opportunities for cost reductions.
    row: 4
    col: 0
    width: 24
    height: 5
  - name: Remote access
    type: text
    title_text: Remote access
    body_text: |-
      **PR.AC-3: Remote access is managed.**

      PR.MA-2: Remote maintenance of organizational assets is approved, logged, and performed in a manner that prevents unauthorized access.

      This dashboard displays information on remote desktop and VPN connections and enables SOC personnel to continuously monitor and analyze remote access activities
    row: 20
    col: 0
    width: 24
    height: 5
  - name: Continuous monitoring
    type: text
    title_text: Continuous monitoring
    body_text: |-
      **DE.CM-1: The network is monitored to detect potential cybersecurity events.**

      DE.CM-3: Personnel activity is monitored to detect potential cybersecurity events.

      DE.CM-7: Monitoring for unauthorized personnel, connections, devices, and software is performed.

      This dashboard enables analysts to monitor and analyze activities of users, devices, software to detect potential cybersecurity incidents.
    row: 44
    col: 0
    width: 24
    height: 5
  - name: Trust Relationships
    type: text
    title_text: Trust Relationships
    body_text: |-
      **DE.CM-1: The network is monitored to detect potential cybersecurity events.**

      DE.CM-3: Personnel activity is monitored to detect potential cybersecurity events.

      DE.CM-7: Monitoring for unauthorized personnel, connections, devices, and software is performed.

      This dashboard enables analysts to monitor and analyze activities of users, devices, software to detect potential cybersecurity incidents.
    row: 61
    col: 0
    width: 24
    height: 5
  - title: Servers Connecting To Client Over Command/Control (copy)
    name: Servers Connecting To Client Over Command/Control (copy)
    model: odm
    explore: wgtraffic_odm
    type: looker_grid
    fields: [wgtraffic_odm.count, wgtraffic_odm.src_ip, wgtraffic_odm.src_port]
    filters:
      datefilter: 'Yes'
      wgtraffic_odm.src_ip: "-Null"
    sorts: [wgtraffic_odm.count desc]
    limit: 500
    dynamic_fields: [{dimension: datefilter, label: DateFilter, expression: 'matches_filter(${wgtraffic_odm.event_time_date},`last
          7 days`)', value_format: !!null '', value_format_name: !!null '', _kind_hint: dimension,
        _type_hint: yesno}]
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
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
    listen:
      Date Date: wgtraffic_odm.event_time_date
    row: 71
    col: 16
    width: 8
    height: 6
  - title: VPN Connections
    name: VPN Connections
    model: ueba
    explore: ueba_vpn_session
    type: looker_scatter
    fields: [ueba_vpn_session.deviating_distance, ueba_vpn_session.nosessions_and_name,
      ueba_vpn_session.score, ueba_vpn_session.event_date, ueba_vpn_session.id]
    sorts: [ueba_vpn_session.event_date desc]
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
    point_style: circle_outline
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    size_by_field: ueba_vpn_session.score
    series_types: {}
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    listen: {}
    row: 38
    col: 8
    width: 16
    height: 6
  - title: External Connections for mobile devices and laptops
    name: External Connections for mobile devices and laptops
    model: odm
    explore: wgevent_odm
    type: table
    fields: [wgevent_odm.src_ip, wgevent_odm.src_mac, wgevent_odm.event_time_date,
      wgevent_odm.src_host]
    filters:
      wgevent_odm.event_time_date: 7 days
      wgevent_odm.event_id: '16000065,16000002'
    sorts: [wgevent_odm.event_time_date desc]
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
    series_types: {}
    transpose: false
    truncate_text: true
    size_to_fit: true
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    defaults_version: 1
    listen: {}
    row: 66
    col: 0
    width: 8
    height: 5
  - title: Resource Monitoring (Inbound/Outbound)
    name: Resource Monitoring (Inbound/Outbound)
    model: agg
    explore: agg_watchguard_proxy
    type: looker_line
    fields: [agg_watchguard_proxy.date_date, agg_watchguard_proxy.entity2, agg_watchguard_proxy.Sum_of_Count]
    pivots: [agg_watchguard_proxy.entity2]
    fill_fields: [agg_watchguard_proxy.date_date]
    filters:
      agg_watchguard_proxy.type: Msg Count
    sorts: [agg_watchguard_proxy.date_date desc, agg_watchguard_proxy.entity2]
    limit: 500
    dynamic_fields: [{measure: sum_of_count, based_on: agg_watchguard_proxy.count,
        expression: '', label: Sum of Count, type: sum, _kind_hint: measure, _type_hint: number}]
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
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
    show_null_points: true
    interpolation: linear
    hide_legend: false
    defaults_version: 1
    listen:
      Date Date: agg_watchguard_proxy.date_date
    row: 9
    col: 0
    width: 9
    height: 6
  - title: Resource Monitoring (TCP/UDP Traffic)
    name: Resource Monitoring (TCP/UDP Traffic)
    model: agg
    explore: agg_watchguard_proxy
    type: looker_line
    fields: [agg_watchguard_proxy.date_date, agg_watchguard_proxy.entity1, agg_watchguard_proxy.Sum_of_Count]
    pivots: [agg_watchguard_proxy.entity1]
    fill_fields: [agg_watchguard_proxy.date_date]
    filters:
      agg_watchguard_proxy.type: Protocol Count
    sorts: [agg_watchguard_proxy.date_date desc, agg_watchguard_proxy.entity1]
    limit: 500
    dynamic_fields: [{measure: sum_of_count, based_on: agg_watchguard_proxy.count,
        expression: '', label: Sum of Count, type: sum, _kind_hint: measure, _type_hint: number}]
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
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    listen:
      Date Date: agg_watchguard_proxy.date_date
    row: 9
    col: 9
    width: 8
    height: 6
  - title: Resource Monitoring (LCE High Events By Type)
    name: Resource Monitoring (LCE High Events By Type)
    model: agg
    explore: agg_watchguard_proxy
    type: looker_line
    fields: [agg_watchguard_proxy.date_date, logtype, agg_watchguard_proxy.Sum_of_Count]
    pivots: [logtype]
    fill_fields: [agg_watchguard_proxy.date_date]
    filters:
      agg_watchguard_proxy.type: Log type count
    sorts: [agg_watchguard_proxy.date_date desc]
    limit: 500
    dynamic_fields: [{measure: sum_of_count, based_on: agg_watchguard_proxy.count,
        type: sum, label: Sum of Count, expression: !!null '', _kind_hint: measure,
        _type_hint: number}, {dimension: logtype, label: LogType, expression: '"traffic"',
        value_format: !!null '', value_format_name: !!null '', _kind_hint: dimension,
        _type_hint: string}]
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
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    series_types: {}
    defaults_version: 1
    listen:
      Date Date: agg_watchguard_proxy.date_date
    row: 9
    col: 17
    width: 7
    height: 6
  - title: Remote Access(Network Trending - RDP Traffic)
    name: Remote Access(Network Trending - RDP Traffic)
    model: agg
    explore: agg_watchguard_proxy
    type: looker_line
    fields: [agg_watchguard_proxy.date_date, agg_watchguard_proxy.entity2, agg_watchguard_proxy.Sum_of_Count]
    pivots: [agg_watchguard_proxy.entity2]
    fill_fields: [agg_watchguard_proxy.date_date]
    filters:
      agg_watchguard_proxy.entity1: '1701,1723,3389'
    sorts: [agg_watchguard_proxy.date_date desc, agg_watchguard_proxy.entity2]
    limit: 500
    dynamic_fields: [{measure: sum_of_count, based_on: agg_watchguard_proxy.count,
        expression: '', label: Sum of Count, type: sum, _kind_hint: measure, _type_hint: number}]
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
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    y_axes: [{label: Total (SUM), orientation: left, series: [{axisId: sum_of_count,
            id: " - sum_of_count", name: Total (Sum)}, {axisId: sum_of_count, id: 0-External
              - sum_of_count, name: 0-External}, {axisId: sum_of_count, id: 0-SSL-VPN
              - sum_of_count, name: 0-SSL-VPN}, {axisId: sum_of_count, id: 0-SSTECH
              WAN - sum_of_count, name: 0-SSTECH WAN}, {axisId: sum_of_count, id: 1-MAIN
              LAN - sum_of_count, name: 1-MAIN LAN}, {axisId: sum_of_count, id: 1-SSTech
              Main Vlan 1 - sum_of_count, name: 1-SSTech Main Vlan 1}, {axisId: sum_of_count,
            id: 1-Trusted - sum_of_count, name: 1-Trusted}, {axisId: sum_of_count,
            id: 10-Big Data Vlan 10 - sum_of_count, name: 10-Big Data Vlan 10}, {
            axisId: sum_of_count, id: 10-VLANBD - sum_of_count, name: 10-VLANBD},
          {axisId: sum_of_count, id: 3-K2O LAN - sum_of_count, name: 3-K2O LAN}, {
            axisId: sum_of_count, id: 4-SSTECH WAN - sum_of_count, name: 4-SSTECH
              WAN}, {axisId: sum_of_count, id: Firebox - sum_of_count, name: Firebox}],
        showLabels: true, showValues: true, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    x_axis_label: Date
    series_types: {}
    series_labels:
      " - sum_of_count": Total (Sum)
    defaults_version: 1
    listen:
      Date Date: agg_watchguard_proxy.date_date
    row: 25
    col: 0
    width: 13
    height: 7
  - title: Top 10 Talkers By  IP  in Lat 7 days
    name: Top 10 Talkers By  IP  in Lat 7 days
    model: agg
    explore: agg_watchguard_proxy
    type: looker_line
    fields: [agg_watchguard_proxy.date_date, agg_watchguard_proxy.entity1, agg_watchguard_proxy.Sum_of_Count]
    pivots: [agg_watchguard_proxy.entity1]
    fill_fields: [agg_watchguard_proxy.date_date]
    filters:
      agg_watchguard_proxy.type: Source IP Count
      datefilter: 'Yes'
    sorts: [agg_watchguard_proxy.date_date desc, agg_watchguard_proxy.entity1]
    limit: 500
    dynamic_fields: [{dimension: datefilter, label: Datefilter, expression: 'matches_filter(${agg_watchguard_proxy.date_date},`last
          7 days`)', value_format: !!null '', value_format_name: !!null '', _kind_hint: dimension,
        _type_hint: yesno}, {measure: sum_of_count, based_on: agg_watchguard_proxy.count,
        expression: '', label: Sum of Count, type: sum, _kind_hint: measure, _type_hint: number}]
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
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    y_axes: [{label: Total(sum), orientation: left, series: [{axisId: sum_of_count,
            id: 0.0.0.0 - sum_of_count, name: 0.0.0.0}, {axisId: sum_of_count, id: 1.0.131.157
              - sum_of_count, name: 1.0.131.157}, {axisId: sum_of_count, id: 1.0.148.139
              - sum_of_count, name: 1.0.148.139}, {axisId: sum_of_count, id: 1.0.180.10
              - sum_of_count, name: 1.0.180.10}, {axisId: sum_of_count, id: 1.0.188.54
              - sum_of_count, name: 1.0.188.54}, {axisId: sum_of_count, id: 1.0.212.56
              - sum_of_count, name: 1.0.212.56}, {axisId: sum_of_count, id: 1.0.214.221
              - sum_of_count, name: 1.0.214.221}, {axisId: sum_of_count, id: 1.0.226.107
              - sum_of_count, name: 1.0.226.107}, {axisId: sum_of_count, id: 1.0.226.144
              - sum_of_count, name: 1.0.226.144}, {axisId: sum_of_count, id: 1.0.226.240
              - sum_of_count, name: 1.0.226.240}, {axisId: sum_of_count, id: 1.0.239.188
              - sum_of_count, name: 1.0.239.188}, {axisId: sum_of_count, id: 1.0.242.206
              - sum_of_count, name: 1.0.242.206}, {axisId: sum_of_count, id: 1.0.245.178
              - sum_of_count, name: 1.0.245.178}, {axisId: sum_of_count, id: 1.0.245.20
              - sum_of_count, name: 1.0.245.20}, {axisId: sum_of_count, id: 1.0.249.43
              - sum_of_count, name: 1.0.249.43}, {axisId: sum_of_count, id: 1.0.253.247
              - sum_of_count, name: 1.0.253.247}, {axisId: sum_of_count, id: 1.1.163.138
              - sum_of_count, name: 1.1.163.138}, {axisId: sum_of_count, id: 1.1.172.128
              - sum_of_count, name: 1.1.172.128}, {axisId: sum_of_count, id: 1.1.173.197
              - sum_of_count, name: 1.1.173.197}, {axisId: sum_of_count, id: 1.1.174.120
              - sum_of_count, name: 1.1.174.120}, {axisId: sum_of_count, id: 1.1.180.171
              - sum_of_count, name: 1.1.180.171}, {axisId: sum_of_count, id: 1.1.187.120
              - sum_of_count, name: 1.1.187.120}, {axisId: sum_of_count, id: 1.1.189.113
              - sum_of_count, name: 1.1.189.113}, {axisId: sum_of_count, id: 1.1.207.7
              - sum_of_count, name: 1.1.207.7}, {axisId: sum_of_count, id: 1.1.230.107
              - sum_of_count, name: 1.1.230.107}, {axisId: sum_of_count, id: 1.1.243.17
              - sum_of_count, name: 1.1.243.17}, {axisId: sum_of_count, id: 1.1.244.158
              - sum_of_count, name: 1.1.244.158}, {axisId: sum_of_count, id: 1.1.245.134
              - sum_of_count, name: 1.1.245.134}, {axisId: sum_of_count, id: 1.10.160.129
              - sum_of_count, name: 1.10.160.129}, {axisId: sum_of_count, id: 1.10.173.103
              - sum_of_count, name: 1.10.173.103}, {axisId: sum_of_count, id: 1.10.184.165
              - sum_of_count, name: 1.10.184.165}, {axisId: sum_of_count, id: 1.10.185.145
              - sum_of_count, name: 1.10.185.145}, {axisId: sum_of_count, id: 1.10.199.87
              - sum_of_count, name: 1.10.199.87}, {axisId: sum_of_count, id: 1.10.215.236
              - sum_of_count, name: 1.10.215.236}, {axisId: sum_of_count, id: 1.10.220.96
              - sum_of_count, name: 1.10.220.96}, {axisId: sum_of_count, id: 1.102.15.214
              - sum_of_count, name: 1.102.15.214}, {axisId: sum_of_count, id: 1.11.174.53
              - sum_of_count, name: 1.11.174.53}, {axisId: sum_of_count, id: 1.11.70.41
              - sum_of_count, name: 1.11.70.41}, {axisId: sum_of_count, id: 1.11.94.2
              - sum_of_count, name: 1.11.94.2}, {axisId: sum_of_count, id: 1.119.0.21
              - sum_of_count, name: 1.119.0.21}, {axisId: sum_of_count, id: 1.119.147.226
              - sum_of_count, name: 1.119.147.226}, {axisId: sum_of_count, id: 1.119.4.249
              - sum_of_count, name: 1.119.4.249}, {axisId: sum_of_count, id: 1.119.44.199
              - sum_of_count, name: 1.119.44.199}, {axisId: sum_of_count, id: 1.119.7.98
              - sum_of_count, name: 1.119.7.98}, {axisId: sum_of_count, id: 1.132.109.251
              - sum_of_count, name: 1.132.109.251}, {axisId: sum_of_count, id: 1.156.135.112
              - sum_of_count, name: 1.156.135.112}, {axisId: sum_of_count, id: 1.158.136.223
              - sum_of_count, name: 1.158.136.223}, {axisId: sum_of_count, id: 1.158.202.204
              - sum_of_count, name: 1.158.202.204}, {axisId: sum_of_count, id: 1.159.230.125
              - sum_of_count, name: 1.159.230.125}, {axisId: sum_of_count, id: 1.160.117.32
              - sum_of_count, name: 1.160.117.32}], showLabels: true, showValues: true,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
    x_axis_label: Date
    defaults_version: 1
    listen:
      Date Date: agg_watchguard_proxy.date_date
    row: 49
    col: 0
    width: 12
    height: 6
  - title: Top Continuous Events in Last 7 days
    name: Top Continuous Events in Last 7 days
    model: agg
    explore: agg_watchguard_proxy
    type: looker_line
    fields: [agg_watchguard_proxy.date_date, agg_watchguard_proxy.Sum_of_Count]
    filters:
      agg_watchguard_proxy.type: Log type count
    sorts: [agg_watchguard_proxy.date_date desc]
    limit: 500
    dynamic_fields: [{dimension: datefilter, label: Datefilter, expression: 'matches_filter(${agg_watchguard_proxy.date_date},`last
          7 days`)', value_format: !!null '', value_format_name: !!null '', _kind_hint: dimension,
        _type_hint: yesno}, {measure: sum_of_count, based_on: agg_watchguard_proxy.count,
        expression: '', label: Sum of Count, type: sum, _kind_hint: measure, _type_hint: number}]
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
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    y_axes: [{label: Total(Sum), orientation: left, series: [{axisId: sum_of_count,
            id: sum_of_count, name: Sum of Count}], showLabels: true, showValues: true,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
    x_axis_label: Date
    series_types: {}
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
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
      Date Date: agg_watchguard_proxy.date_date
    row: 49
    col: 12
    width: 12
    height: 6
  - title: Top Active Users in Last 7 days
    name: Top Active Users in Last 7 days
    model: agg
    explore: agg_watchguard_proxy
    type: looker_line
    fields: [agg_watchguard_proxy.entity1, agg_watchguard_proxy.date_date, agg_watchguard_proxy.Sum_of_Count]
    pivots: [agg_watchguard_proxy.entity1]
    fill_fields: [agg_watchguard_proxy.date_date]
    filters:
      agg_watchguard_proxy.type: Sourceuser count
      datefilter: 'Yes'
    sorts: [agg_watchguard_proxy.date_date desc, agg_watchguard_proxy.entity1]
    limit: 500
    dynamic_fields: [{dimension: datefilter, label: DateFilter, expression: 'matches_filter(${agg_watchguard_proxy.date_date},`last
          7 days`)', value_format: !!null '', value_format_name: !!null '', _kind_hint: dimension,
        _type_hint: yesno}, {measure: sum_of_count, based_on: agg_watchguard_proxy.count,
        expression: '', label: Sum of Count, type: sum, _kind_hint: measure, _type_hint: number}]
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
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    y_axes: [{label: Total(sum), orientation: left, series: [{axisId: sum_of_count,
            id: ahmedi.zaitun@sstech.internal - sum_of_count, name: ahmedi.zaitun@sstech.internal},
          {axisId: sum_of_count, id: akhil.polamarasetty@sstech.internal - sum_of_count,
            name: akhil.polamarasetty@sstech.internal}, {axisId: sum_of_count, id: Akhil.Polamarasetty@sstech.internal
              - sum_of_count, name: Akhil.Polamarasetty@sstech.internal}, {axisId: sum_of_count,
            id: akhila.thota@sstech.internal - sum_of_count, name: akhila.thota@sstech.internal},
          {axisId: sum_of_count, id: amitkumar@sstech.internal - sum_of_count, name: amitkumar@sstech.internal},
          {axisId: sum_of_count, id: amutha.shanmugaraja@sstech.internal - sum_of_count,
            name: amutha.shanmugaraja@sstech.internal}, {axisId: sum_of_count, id: anandbir.singh@sstech.internal
              - sum_of_count, name: anandbir.singh@sstech.internal}, {axisId: sum_of_count,
            id: andrew.vincent@sstech.internal - sum_of_count, name: andrew.vincent@sstech.internal},
          {axisId: sum_of_count, id: anil.donthireddy@sstech.internal - sum_of_count,
            name: anil.donthireddy@sstech.internal}, {axisId: sum_of_count, id: anitha.singamsetti@sstech.internal
              - sum_of_count, name: anitha.singamsetti@sstech.internal}, {axisId: sum_of_count,
            id: annapurna.a@sstech.internal - sum_of_count, name: annapurna.a@sstech.internal},
          {axisId: sum_of_count, id: anuja.kotha@sstech.internal - sum_of_count, name: anuja.kotha@sstech.internal},
          {axisId: sum_of_count, id: anuradha.adhikari@sstech.internal - sum_of_count,
            name: anuradha.adhikari@sstech.internal}, {axisId: sum_of_count, id: Anusha.Andiboyina@sstech.internal
              - sum_of_count, name: Anusha.Andiboyina@sstech.internal}, {axisId: sum_of_count,
            id: aqeel.qureshi@sstech.internal - sum_of_count, name: aqeel.qureshi@sstech.internal},
          {axisId: sum_of_count, id: Aravind.Sivaji@sstech.internal - sum_of_count,
            name: Aravind.Sivaji@sstech.internal}, {axisId: sum_of_count, id: ashish.meshram@sstech.internal
              - sum_of_count, name: ashish.meshram@sstech.internal}, {axisId: sum_of_count,
            id: ashok.y@sstech.internal - sum_of_count, name: ashok.y@sstech.internal},
          {axisId: sum_of_count, id: Backend-Service@Any - sum_of_count, name: Backend-Service@Any},
          {axisId: sum_of_count, id: bala.boppudi@sstech.internal - sum_of_count,
            name: bala.boppudi@sstech.internal}, {axisId: sum_of_count, id: Bhavyashree.r@sstech.internal
              - sum_of_count, name: Bhavyashree.r@sstech.internal}, {axisId: sum_of_count,
            id: Bryan.Lauer@sstech.internal - sum_of_count, name: Bryan.Lauer@sstech.internal},
          {axisId: sum_of_count, id: Chaitali.Sonparote@sstech.internal - sum_of_count,
            name: Chaitali.Sonparote@sstech.internal}, {axisId: sum_of_count, id: Clifford.Riddick@sstech.internal
              - sum_of_count, name: Clifford.Riddick@sstech.internal}, {axisId: sum_of_count,
            id: Harsha.Tilokani@sstech.internal - sum_of_count, name: Harsha.Tilokani@sstech.internal},
          {axisId: sum_of_count, id: Hemalatha.Reddy@sstech.internal - sum_of_count,
            name: Hemalatha.Reddy@sstech.internal}, {axisId: sum_of_count, id: Jean.Hypes@sstech.internal
              - sum_of_count, name: Jean.Hypes@sstech.internal}, {axisId: sum_of_count,
            id: Kerri.C@sstech.internal - sum_of_count, name: Kerri.C@sstech.internal},
          {axisId: sum_of_count, id: Lee.Williams@sstech.internal - sum_of_count,
            name: Lee.Williams@sstech.internal}, {axisId: sum_of_count, id: Mahima.Chhabra@sstech.internal
              - sum_of_count, name: Mahima.Chhabra@sstech.internal}, {axisId: sum_of_count,
            id: Manjunath.Sindagi@sstech.internal - sum_of_count, name: Manjunath.Sindagi@sstech.internal},
          {axisId: sum_of_count, id: Maxim.Dashenko@sstech.internal - sum_of_count,
            name: Maxim.Dashenko@sstech.internal}, {axisId: sum_of_count, id: Murali.Pachipala@sstech.internal
              - sum_of_count, name: Murali.Pachipala@sstech.internal}, {axisId: sum_of_count,
            id: Narmada.Rajagopalan@sstech.internal - sum_of_count, name: Narmada.Rajagopalan@sstech.internal},
          {axisId: sum_of_count, id: Nizamuddin.Shaik@sstech.internal - sum_of_count,
            name: Nizamuddin.Shaik@sstech.internal}, {axisId: sum_of_count, id: Rajesh.Pasupuleti@sstech.internal
              - sum_of_count, name: Rajesh.Pasupuleti@sstech.internal}, {axisId: sum_of_count,
            id: Rajnikanth.chouhan@sstech.internal - sum_of_count, name: Rajnikanth.chouhan@sstech.internal},
          {axisId: sum_of_count, id: Rakshanda.Nausheen@sstech.internal - sum_of_count,
            name: Rakshanda.Nausheen@sstech.internal}, {axisId: sum_of_count, id: Ravi.Thota@sstech.internal
              - sum_of_count, name: Ravi.Thota@sstech.internal}, {axisId: sum_of_count,
            id: Satish.Chilkury@sstech.internal - sum_of_count, name: Satish.Chilkury@sstech.internal},
          {axisId: sum_of_count, id: Sravanthi.k@sstech.internal - sum_of_count, name: Sravanthi.k@sstech.internal},
          {axisId: sum_of_count, id: Sreedharv@sstech.internal - sum_of_count, name: Sreedharv@sstech.internal},
          {axisId: sum_of_count, id: Sridevi.Veeramachane@sstech.internal - sum_of_count,
            name: Sridevi.Veeramachane@sstech.internal}, {axisId: sum_of_count, id: Srinivas.badam@sstech.internal
              - sum_of_count, name: Srinivas.badam@sstech.internal}, {axisId: sum_of_count,
            id: Sujitha.Ravula@sstech.internal - sum_of_count, name: Sujitha.Ravula@sstech.internal},
          {axisId: sum_of_count, id: Sunanda.Unni@sstech.internal - sum_of_count,
            name: Sunanda.Unni@sstech.internal}, {axisId: sum_of_count, id: Suresh.Nadgonde@sstech.internal
              - sum_of_count, name: Suresh.Nadgonde@sstech.internal}, {axisId: sum_of_count,
            id: Thomas.McCroskey@sstech.internal - sum_of_count, name: Thomas.McCroskey@sstech.internal},
          {axisId: sum_of_count, id: Vasavi.joola@sstech.internal - sum_of_count,
            name: Vasavi.joola@sstech.internal}, {axisId: sum_of_count, id: Venkatram.kanuru@sstech.internal
              - sum_of_count, name: Venkatram.kanuru@sstech.internal}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    x_axis_label: Date
    defaults_version: 1
    listen:
      Date Date: agg_watchguard_proxy.date_date
    row: 55
    col: 12
    width: 12
    height: 6
  - title: Top Hosts with Most Outbound External Connections
    name: Top Hosts with Most Outbound External Connections
    model: agg
    explore: agg_watchguard_proxy
    type: looker_pie
    fields: [agg_watchguard_proxy.entity1, agg_watchguard_proxy.Sum_of_Count]
    filters:
      agg_watchguard_proxy.type: Source IP Count
      agg_watchguard_proxy.entity1: "-10.10%,-192.168%,-Null,-Empty,-1,-10.1,-10.10"
    limit: 10
    dynamic_fields: [{measure: sum_of_count, based_on: agg_watchguard_proxy.count,
        type: sum, label: Sum of Count, expression: !!null '', _kind_hint: measure,
        _type_hint: number}, {dimension: datefilter, label: DateFilter, expression: 'matches_filter(${agg_watchguard_proxy.date_date},`last
          7 days`)', value_format: !!null '', value_format_name: !!null '', _kind_hint: dimension,
        _type_hint: yesno}]
    value_labels: labels
    label_type: labPer
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    y_axes: [{label: Total(sum), orientation: left, series: [{axisId: sum_of_count,
            id: sum_of_count, name: Sum of Count}], showLabels: true, showValues: true,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
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
    series_types: {}
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
    listen:
      Date Date: agg_watchguard_proxy.date_date
    row: 66
    col: 8
    width: 8
    height: 5
  - title: Top Hosts with Most Internal Connections
    name: Top Hosts with Most Internal Connections (2)
    model: agg
    explore: agg_watchguard_proxy
    type: looker_pie
    fields: [agg_watchguard_proxy.entity1, agg_watchguard_proxy.Sum_of_Count]
    filters:
      agg_watchguard_proxy.type: Source IP Count
      agg_watchguard_proxy.entity1: "-Null,-Empty,10.10%"
    limit: 10
    dynamic_fields: [{dimension: datefilter, label: DateFilter, expression: 'matches_filter(${agg_watchguard_proxy.date_date},`last
          7 days`)', value_format: !!null '', value_format_name: !!null '', _kind_hint: dimension,
        _type_hint: yesno}, {measure: sum_of_count, based_on: agg_watchguard_proxy.count,
        expression: '', label: Sum of Count, type: sum, _kind_hint: measure, _type_hint: number}]
    value_labels: labels
    label_type: labPer
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
    listen:
      Date Date: agg_watchguard_proxy.date_date
    row: 66
    col: 16
    width: 8
    height: 5
  filters:
  - name: Date Date
    title: Date Date
    type: date_filter
    default_value: 7 days
    allow_multiple_values: true
    required: false
