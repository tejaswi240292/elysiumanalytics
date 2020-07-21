- dashboard: nist800171_reports_part1
  title: NIST-(800-171) Reports Part-1
  layout: newspaper
  elements:
  - title: Windows Account and Group Information
    name: Windows Account and Group Information
    model: agg
    explore: windows_account_and_group_information
    type: looker_grid
    fields: [windows_account_and_group_information.eventid, windows_account_and_group_information.type]
    sorts: [windows_account_and_group_information.eventid]
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
    series_column_widths:
      windows_account_and_group_information.eventid: 324
    row: 14
    col: 8
    width: 16
    height: 6
  - title: Logon and Logoff Monitoring Details
    name: Logon and Logoff Monitoring Details
    model: agg
    explore: agg_windows
    type: looker_grid
    fields: [agg_windows.count, agg_windows.date_date, agg_windows.hour, agg_windows.eventid,
      agg_windows.type, agg_windows.entity1, agg_windows.entity2]
    filters:
      agg_windows.eventid: '4625,4624,4647,4648,4634'
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
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_types: {}
    defaults_version: 1
    column_order: ["$$$_row_numbers_$$$", agg_windows.type, agg_windows.count, agg_windows.date_date,
      agg_windows.hour, agg_windows.eventid, agg_windows.entity1, agg_windows.entity2]
    row: 38
    col: 0
    width: 24
    height: 5
  - name: NIST-(800-171) Reports Part-1
    type: text
    title_text: NIST-(800-171) Reports Part-1
    body_text: |-
      **NIST-(800-171) Reports Part-1**

      - **User Access and Least Privileges**
      - **Login and Logoff Monitoring**
      - **Boundary Defenses**
      - **Remote Access**
    row: 0
    col: 0
    width: 24
    height: 5
  - name: User Access and Least Privilege
    type: text
    title_text: User Access and Least Privilege
    body_text: |-
      User Access and Least Privilege (AC-6; AC-6(1); AC-6(2); AC-6(5); AC-6(9); AC-6(10))

      User account management, access control, and enforcement of least privilege are critical to effective network security. Without these, the risk of network intrusion and compromise, insider activity, and data loss is increased. This dashboard deals with user account management, credential management, and least privilege.
    row: 5
    col: 0
    width: 24
    height: 5
  - name: Logon and Logoff Monitoring (AC-7)
    type: text
    title_text: Logon and Logoff Monitoring (AC-7)
    body_text: |-
      **Logon and Logoff Monitoring (AC-7)

      NIST requirements state that user access to the system be recorded and monitored for possible abuse. This requirement, apart from detecting the security breaches, allows IT security administrators to document access to confidential medical details by legitimate users.

      EventLog Analyzer's Successful User Logons and Logoffs report includes detailed information such as the user name, date and time of the logon and logoff events, reason for the logon failure, and more.**
    row: 20
    col: 0
    width: 24
    height: 6
  - name: Boundary Defenses
    type: text
    title_text: Boundary Defenses
    body_text: |-
      Boundary Defenses (AC-20; AC-20(1); AC-20(2))

      Organizations today can no longer afford to rely on conventional network defense devices to monitor and protect a network, both internally and externally. The lack of a multi-layered security strategy across each network segment could lead to intrusions and persistent threats. This dashboard displays information from network security devices and services.
    row: 43
    col: 0
    width: 24
    height: 5
  - name: Remote Access
    type: text
    title_text: Remote Access
    body_text: |-
      **Remote Access (AC-17(1); AC-17(2); AC-17(3); AC-17(4))

      More organizations today are implementing remote access technologies, which allow employees to access network resources from virtually any device anywhere. However, ensuring the security of remote access technology can be a challenging task for any organization to undertake. This dashboard allows an organization to monitor remote desktop and VPN network connections.**
    row: 59
    col: 0
    width: 24
    height: 5
  - title: Subnet B Class
    name: Subnet B Class
    model: agg
    explore: agg_watchguard_proxy
    type: looker_grid
    fields: [agg_watchguard_proxy.entity1, sum_of_count]
    filters:
      agg_watchguard_proxy.entity1: "-NULL"
      agg_watchguard_proxy.type: Source IP Count
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
    show_totals: true
    show_row_totals: true
    series_cell_visualizations:
      sum_of_count:
        is_active: true
    series_types: {}
    defaults_version: 1
    row: 53
    col: 0
    width: 8
    height: 6
  - title: Subnet C Class
    name: Subnet C Class
    model: agg
    explore: agg_watchguard_proxy
    type: looker_grid
    fields: [agg_watchguard_proxy.entity1, sum_of_count]
    filters:
      agg_watchguard_proxy.entity1: "-NULL"
      agg_watchguard_proxy.type: Destination IP Count
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
    show_totals: true
    show_row_totals: true
    series_cell_visualizations:
      sum_of_count:
        is_active: true
    series_types: {}
    defaults_version: 1
    listen: {}
    row: 53
    col: 8
    width: 8
    height: 6
  - title: Port Usage
    name: Port Usage
    model: agg
    explore: agg_watchguard_proxy
    type: looker_grid
    fields: [agg_watchguard_proxy.entity1, sum_of_count]
    filters:
      agg_watchguard_proxy.entity1: "-NULL"
      agg_watchguard_proxy.type: Source Port Count
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
    show_totals: true
    show_row_totals: true
    series_cell_visualizations:
      sum_of_count:
        is_active: true
    series_types: {}
    defaults_version: 1
    listen: {}
    row: 53
    col: 16
    width: 8
    height: 6
  - title: Remote Access- Network RDP Traffic
    name: Remote Access- Network RDP Traffic
    model: agg
    explore: agg_watchguard_proxy
    type: looker_grid
    fields: [sum_of_count, agg_watchguard_proxy.entity1, agg_watchguard_proxy.entity2]
    filters:
      agg_watchguard_proxy.type: Policy Count
      agg_watchguard_proxy.entity2: "-NULL"
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
    column_order: ["$$$_row_numbers_$$$", agg_watchguard_proxy.entity2, agg_watchguard_proxy.entity1,
      sum_of_count]
    show_totals: true
    show_row_totals: true
    series_labels:
      agg_watchguard_proxy.entity2: Protocol
      agg_watchguard_proxy.entity1: Policy
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
    show_null_points: true
    interpolation: linear
    series_types: {}
    defaults_version: 1
    listen: {}
    row: 70
    col: 0
    width: 8
    height: 6
  - title: Remote Access- RDP user summary
    name: Remote Access- RDP user summary
    model: agg
    explore: agg_watchguard_proxy
    type: looker_grid
    fields: [sum_of_count, agg_watchguard_proxy.entity1]
    filters:
      agg_watchguard_proxy.type: Source IP Count
      agg_watchguard_proxy.entity2: "-NULL"
      agg_watchguard_proxy.entity1: "-NULL"
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
    column_order: ["$$$_row_numbers_$$$", agg_watchguard_proxy.entity2, agg_watchguard_proxy.entity1,
      sum_of_count]
    show_totals: true
    show_row_totals: true
    series_labels:
      agg_watchguard_proxy.entity2: Protocol
      agg_watchguard_proxy.entity1: SourceIp
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
    show_null_points: true
    interpolation: linear
    series_types: {}
    defaults_version: 1
    listen: {}
    row: 70
    col: 8
    width: 8
    height: 6
  - title: Remote Access- RDP user summary (copy)
    name: Remote Access- RDP user summary (copy)
    model: agg
    explore: agg_watchguard_proxy
    type: looker_grid
    fields: [sum_of_count, agg_watchguard_proxy.entity1]
    filters:
      agg_watchguard_proxy.type: Source IP Count
      agg_watchguard_proxy.entity2: "-NULL"
      agg_watchguard_proxy.entity1: "-NULL"
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
    column_order: ["$$$_row_numbers_$$$", agg_watchguard_proxy.entity2, agg_watchguard_proxy.entity1,
      sum_of_count]
    show_totals: true
    show_row_totals: true
    series_labels:
      agg_watchguard_proxy.entity2: Protocol
      agg_watchguard_proxy.entity1: SourceIp
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
    show_null_points: true
    interpolation: linear
    series_types: {}
    defaults_version: 1
    listen: {}
    row: 70
    col: 16
    width: 8
    height: 6
  - title: User Access and Least Privilege Compliance Checks
    name: User Access and Least Privilege Compliance Checks
    model: agg
    explore: agg_windows
    type: looker_line
    fields: [agg_windows.date_date, sum_of_count, agg_windows.ActionType3]
    filters:
      agg_windows.date_date: 7 days
      agg_windows.eventid: '628,627,4794,4724,4723'
    sorts: [agg_windows.date_date desc]
    limit: 500
    dynamic_fields: [{measure: sum_of_count, based_on: agg_windows.count, expression: '',
        label: Sum of Count, type: sum, _kind_hint: measure, _type_hint: number}]
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
    series_labels:
      sum_of_count: Total(Sum)
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    listen: {}
    row: 10
    col: 0
    width: 8
    height: 4
  - title: File and Directory Change Event Trends
    name: File and Directory Change Event Trends
    model: agg
    explore: agg_windows
    type: looker_line
    fields: [agg_windows.date_date, agg_windows.ActionType, agg_windows.Sum_of_Count]
    filters:
      agg_windows.date_date: 7 days
    sorts: [agg_windows.date_date desc]
    limit: 500
    dynamic_fields: [{measure: sum_of_count, based_on: agg_windows.count, expression: '',
        label: Sum of Count, type: sum, _kind_hint: measure, _type_hint: number}]
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
    series_labels:
      sum_of_count: Total(Sum)
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    listen: {}
    row: 10
    col: 8
    width: 9
    height: 4
  - title: Access Information and Changes
    name: Access Information and Changes
    model: agg
    explore: agg_windows
    type: looker_bar
    fields: [agg_windows.ActionType2, agg_windows.Count_of_Count]
    filters:
      agg_windows.date_date: 7 days
    limit: 500
    dynamic_fields: [{measure: count_of_count, based_on: agg_windows.count, expression: '',
        label: Count of Count, type: count_distinct, _kind_hint: measure, _type_hint: number}]
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
    x_axis_label: Actiontype
    series_types: {}
    series_labels:
      count_of_count: Metric:Count
    defaults_version: 1
    listen: {}
    row: 10
    col: 17
    width: 7
    height: 4
  - title: Suspicious Access Activity
    name: Suspicious Access Activity
    model: agg
    explore: suspicious_access_activity
    type: looker_pie
    fields: [suspicious_access_activity.actiontype, suspicious_access_activity.Sum_of_sumcount]
    filters:
      suspicious_access_activity.datefilter: 30 days
    sorts: [suspicious_access_activity.actiontype]
    limit: 500
    dynamic_fields: [{measure: sum_of_sumcount, based_on: suspicious_access_activity.sumcount,
        expression: '', label: Sum of Sumcount, type: sum, _kind_hint: measure, _type_hint: number}]
    value_labels: legend
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
    listen: {}
    row: 14
    col: 0
    width: 8
    height: 6
  - title: Logon and Logoff Monitoring Summary
    name: Logon and Logoff Monitoring Summary
    model: agg
    explore: agg_windows
    type: looker_pie
    fields: [agg_windows.type, agg_windows.Sum_of_Count]
    filters:
      agg_windows.eventid: '4624,4625,4634,4647,4648'
    limit: 500
    dynamic_fields: [{measure: sum_of_count, based_on: agg_windows.count, expression: '',
        label: Sum of Count, type: sum, _kind_hint: measure, _type_hint: number}]
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
    listen: {}
    row: 26
    col: 0
    width: 8
    height: 6
  - title: Logon and Logoff Monitoring Trends
    name: Logon and Logoff Monitoring Trends
    model: agg
    explore: agg_windows
    type: looker_line
    fields: [agg_windows.date_date, agg_windows.type, agg_windows.Sum_of_Count]
    pivots: [agg_windows.type]
    fill_fields: [agg_windows.date_date]
    filters:
      agg_windows.eventid: '4624,4625,4634,4647,4648'
    sorts: [agg_windows.date_date desc, agg_windows.type]
    limit: 500
    dynamic_fields: [{measure: sum_of_count, based_on: agg_windows.count, expression: '',
        label: Sum of Count, type: sum, _kind_hint: measure, _type_hint: number}]
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
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
    listen: {}
    row: 26
    col: 8
    width: 16
    height: 6
  - title: Top 10 Logon and Logoff Monitoring Users
    name: Top 10 Logon and Logoff Monitoring Users
    model: agg
    explore: agg_windows
    type: looker_pie
    fields: [agg_windows.entity2, agg_windows.Sum_of_Count]
    filters:
      agg_windows.eventid: '4624,4625,4634,4647,4648'
    limit: 10
    dynamic_fields: [{measure: sum_of_count, based_on: agg_windows.count, expression: '',
        label: Sum of Count, type: sum, _kind_hint: measure, _type_hint: number}]
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
    listen: {}
    row: 32
    col: 0
    width: 12
    height: 6
  - title: Top 10 Logon and Logoff Monitoring Hosts
    name: Top 10 Logon and Logoff Monitoring Hosts
    model: agg
    explore: agg_windows
    type: looker_pie
    fields: [agg_windows.entity1, agg_windows.Sum_of_Count]
    filters:
      agg_windows.eventid: '4624,4625,4634,4648,4647'
    limit: 10
    dynamic_fields: [{measure: sum_of_count, based_on: agg_windows.count, type: sum,
        label: Sum of Count, expression: !!null '', value_format: !!null '', value_format_name: !!null '',
        _kind_hint: measure, _type_hint: number}]
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
    listen: {}
    row: 32
    col: 12
    width: 12
    height: 6
  - title: IDS Trend-InBound
    name: IDS Trend-InBound
    model: agg
    explore: agg_watchguard_proxy
    type: looker_line
    fields: [agg_watchguard_proxy.date_date, agg_watchguard_proxy.entity1, agg_watchguard_proxy.Sum_of_Count]
    pivots: [agg_watchguard_proxy.entity1]
    fill_fields: [agg_watchguard_proxy.date_date]
    filters:
      agg_watchguard_proxy.entity2: 0-External
      agg_watchguard_proxy.type: Msg Count
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
    listen: {}
    row: 48
    col: 0
    width: 12
    height: 5
  - title: IDS Trend-Outbound
    name: IDS Trend-Outbound
    model: agg
    explore: agg_watchguard_proxy
    type: looker_line
    fields: [agg_watchguard_proxy.date_date, agg_watchguard_proxy.entity1, agg_watchguard_proxy.Sum_of_Count]
    pivots: [agg_watchguard_proxy.entity1]
    fill_fields: [agg_watchguard_proxy.date_date]
    filters:
      agg_watchguard_proxy.entity2: 0-External
      agg_watchguard_proxy.type: Destination Port Count
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
    listen: {}
    row: 48
    col: 12
    width: 12
    height: 5
  - title: Remote Access- Network RDP Traffic (copy)
    name: Remote Access- Network RDP Traffic (copy)
    model: agg
    explore: agg_watchguard_proxy
    type: looker_line
    fields: [agg_watchguard_proxy.date_date, agg_watchguard_proxy.entity1, agg_watchguard_proxy.Sum_of_Count]
    pivots: [agg_watchguard_proxy.entity1]
    fill_fields: [agg_watchguard_proxy.date_date]
    filters:
      agg_watchguard_proxy.type: Policy Count
      agg_watchguard_proxy.entity2: "-NULL"
    sorts: [agg_watchguard_proxy.entity1]
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
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    show_row_numbers: true
    transpose: false
    truncate_text: true
    size_to_fit: true
    series_cell_visualizations:
      sum_of_count:
        is_active: true
    table_theme: white
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_types: {}
    hide_totals: false
    hide_row_totals: false
    defaults_version: 1
    listen: {}
    row: 64
    col: 0
    width: 24
    height: 6
