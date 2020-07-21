- dashboard: sox_it_compliance
  title: SOX IT COMPLIANCE
  layout: newspaper
  elements:
  - name: User Logon and Logoff
    type: text
    title_text: User Logon and Logoff
    body_text: "**Monitors the logon and logoff activities of users across the network.\
      \ It provides premade reports for successful or failed logons and logoffs. It\
      \ also alerts you in real time of any unauthorized access.**"
    row: 4
    col: 0
    width: 24
    height: 3
  - title: Logon and Logoff Details
    name: Logon and Logoff Details
    model: agg
    explore: agg_windows
    type: looker_grid
    fields: [agg_windows.type, agg_windows.eventid, agg_windows.date_date, agg_windows.hour,
      agg_windows.entity1, agg_windows.entity2, sum_of_count]
    filters:
      agg_windows.eventid: '4648,4624,4647,4634,4625'
    sorts: [agg_windows.date_date desc]
    limit: 500
    dynamic_fields: [{measure: sum_of_count, based_on: agg_windows.count, expression: '',
        label: Sum of Count, type: sum, _kind_hint: measure, _type_hint: number}]
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
      agg_windows.date_date: EventDate
      agg_windows.entity1: ReportingHost
      agg_windows.entity2: SourceUserId
      agg_windows.type: EventName
    series_cell_visualizations:
      sum_of_count:
        is_active: true
    series_types: {}
    defaults_version: 1
    listen: {}
    row: 13
    col: 8
    width: 16
    height: 6
  - name: User Access
    type: text
    title_text: User Access
    body_text: "**Individual user actions with the Individual User Action report,\
      \ which gives detailed information on the user's logon and logoff, session activities,\
      \ access to a file or directory, and more.**"
    row: 33
    col: 0
    width: 24
    height: 2
  - name: Logoff Details
    type: text
    title_text: Logoff Details
    body_text: "**Records all unsuccessful logon attempts on the network. It provides\
      \ exhaustive information on logon failures such as who attempted to log on,\
      \ the date and time of the occurrence, and more**"
    row: 19
    col: 0
    width: 24
    height: 2
  - title: Logoff Details
    name: Logoff Details (2)
    model: agg
    explore: agg_windows
    type: looker_grid
    fields: [agg_windows.type, agg_windows.eventid, agg_windows.date_date, agg_windows.hour,
      agg_windows.entity1, agg_windows.entity2, sum_of_count]
    filters:
      agg_windows.eventid: '4648,4647,4634,4625'
    sorts: [agg_windows.date_date desc]
    limit: 500
    dynamic_fields: [{measure: sum_of_count, based_on: agg_windows.count, expression: '',
        label: Sum of Count, type: sum, _kind_hint: measure, _type_hint: number}]
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
      agg_windows.date_date: EventDate
      agg_windows.entity1: ReportingHost
      agg_windows.entity2: SourceUserId
      agg_windows.type: EventName
    series_cell_visualizations:
      sum_of_count:
        is_active: true
    series_types: {}
    defaults_version: 1
    listen: {}
    row: 27
    col: 8
    width: 16
    height: 6
  - title: User Access & Least Privilege(Host Alerts by User)
    name: User Access & Least Privilege(Host Alerts by User)
    model: agg
    explore: agg_windows
    type: looker_grid
    fields: [sum_of_count, agg_windows.type, agg_windows.eventid, agg_windows.date_date,
      agg_windows.hour]
    filters:
      agg_windows.hour: "[18, 23]"
    sorts: [sum_of_count desc]
    limit: 500
    dynamic_fields: [{measure: sum_of_count, based_on: agg_windows.count, expression: '',
        label: Sum of Count, type: sum, _kind_hint: measure, _type_hint: number}]
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
      agg_windows.date_date: EventDate
    series_cell_visualizations:
      sum_of_count:
        is_active: true
    value_labels: legend
    label_type: labPer
    series_types: {}
    defaults_version: 1
    listen: {}
    row: 35
    col: 0
    width: 8
    height: 6
  - title: User Access and Least Privilege Compliance Checks
    name: User Access and Least Privilege Compliance Checks
    model: agg
    explore: agg_windows
    type: looker_grid
    fields: [agg_windows.date_date, agg_windows.ActionType, agg_windows.hour, agg_windows.type,
      agg_windows.eventid, sum_of_count]
    filters:
      agg_windows.eventid: '4723,4724,4794,627,628,624,630,4720,4726,528,529,530,531,532,533,534,535,536,537,539,540,4624,4625,4634,4647,4648'
    sorts: [agg_windows.date_date desc]
    limit: 500
    dynamic_fields: [{measure: sum_of_count, based_on: agg_windows.count, expression: '',
        label: Sum of Count, type: sum, _kind_hint: measure, _type_hint: number}]
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
      agg_windows.date_date: EventDate
    series_cell_visualizations:
      sum_of_count:
        is_active: true
    series_types: {}
    defaults_version: 1
    row: 41
    col: 0
    width: 14
    height: 6
  - name: Successful or Unsuccessful Validatation
    type: text
    title_text: Successful or Unsuccessful Validatation
    body_text: "**Successful or unsuccessful user account logon events, which are\
      \ generated when a domain user account is authenticated on a domain controller.\
      \ It also provides detailed information on the user account validation. \n\n\
      It provides a premade report for user group-level changes such as addition and\
      \ removal of global or local groups, members from a global or local group, and\
      \ more.**"
    row: 53
    col: 0
    width: 24
    height: 3
  - title: Windows Account and Group Information
    name: Windows Account and Group Information
    model: agg
    explore: windows_account_and_group_information
    type: looker_grid
    fields: [windows_account_and_group_information.type, windows_account_and_group_information.eventid,
      sum_of_count]
    sorts: [windows_account_and_group_information.type]
    limit: 500
    dynamic_fields: [{measure: sum_of_count, based_on: windows_account_and_group_information.count,
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
    row: 41
    col: 14
    width: 10
    height: 6
  - title: Administrative Activities Details
    name: Administrative Activities Details
    model: agg
    explore: agg_windows
    type: looker_grid
    fields: [agg_windows.type, agg_windows.eventid, agg_windows.date_date, agg_windows.hour,
      agg_windows.entity1, agg_windows.entity2, sum_of_count]
    filters:
      agg_windows.eventid: '4726,644,4740,4738,4720,4704,630,624'
    sorts: [agg_windows.date_date desc]
    limit: 500
    dynamic_fields: [{measure: sum_of_count, based_on: agg_windows.count, expression: '',
        label: Sum of Count, type: sum, _kind_hint: measure, _type_hint: number}]
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
      agg_windows.date_date: EventDate
      agg_windows.entity1: ReportingHost
      agg_windows.entity2: SourceUserId
      agg_windows.type: EventName
    series_cell_visualizations:
      sum_of_count:
        is_active: true
    series_types: {}
    defaults_version: 1
    listen: {}
    row: 62
    col: 8
    width: 16
    height: 6
  - name: Continuous monitoring
    type: text
    title_text: Continuous monitoring
    body_text: "**Continuous network monitoring helps an organization maintain ongoing\
      \ awareness of its network and security. This dashboard deals with continuous\
      \ monitoring, anomaly detection, and log correlation and analysis.**"
    row: 68
    col: 0
    width: 24
    height: 3
  - title: Network Mapping
    name: Network Mapping
    model: agg
    explore: agg_watchguard_proxy
    type: looker_grid
    fields: [agg_watchguard_proxy.date_date, agg_watchguard_proxy.entity1]
    filters:
      agg_watchguard_proxy.type: Source IP count
    sorts: [agg_watchguard_proxy.date_date desc]
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
    row: 77
    col: 0
    width: 9
    height: 6
  - title: Top Most Active Users
    name: Top Most Active Users
    model: odm
    explore: wgtraffic_odm
    type: looker_line
    fields: [wgtraffic_odm.event_time_date, wgtraffic_odm.src_user_name, wgtraffic_odm.count]
    pivots: [wgtraffic_odm.src_user_name]
    fill_fields: [wgtraffic_odm.event_time_date]
    filters:
      wgtraffic_odm.src_if: "-NULL"
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
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    series_types: {}
    defaults_version: 1
    row: 77
    col: 9
    width: 15
    height: 6
  - name: SOX
    type: text
    title_text: SOX
    body_text: |-
      - **SOX IT Compliance**
      - **User Logon and Logoff**
      -  **Logon Failure**
      - **User Access**
      - **Successful or Unsuccessful Validation & User group changes**
      - **Continuous Monitoring**
    row: 0
    col: 0
    width: 24
    height: 4
  - title: logon and logoff Summary
    name: logon and logoff Summary
    model: agg
    explore: agg_windows
    type: looker_pie
    fields: [agg_windows.type, agg_windows.Sum_of_Count]
    filters:
      agg_windows.eventid: '4648,4624,4647,4634,4625'
    limit: 500
    dynamic_fields: [{measure: sum_of_count, based_on: agg_windows.count, expression: '',
        label: Sum of Count, type: sum, _kind_hint: measure, _type_hint: number}]
    value_labels: labels
    label_type: labPer
    series_types: {}
    defaults_version: 1
    listen: {}
    row: 7
    col: 0
    width: 8
    height: 6
  - title: Logon and Logoff Trends
    name: Logon and Logoff Trends
    model: agg
    explore: agg_windows
    type: looker_line
    fields: [agg_windows.type, agg_windows.date_date, agg_windows.Sum_of_Count]
    pivots: [agg_windows.type]
    fill_fields: [agg_windows.date_date]
    filters:
      agg_windows.eventid: '4648,4624,4647,4634,4625'
    sorts: [agg_windows.type]
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
    value_labels: legend
    label_type: labPer
    defaults_version: 1
    listen: {}
    row: 7
    col: 8
    width: 8
    height: 6
  - title: Top 10 Logon and Logoff Hosts
    name: Top 10 Logon and Logoff Hosts
    model: agg
    explore: agg_windows
    type: looker_pie
    fields: [agg_windows.entity1, agg_windows.Sum_of_Count]
    filters:
      agg_windows.eventid: '4648,4624,4647,4634,4625'
      agg_windows.entity2: "-NULL,--"
    limit: 10
    dynamic_fields: [{measure: sum_of_count, based_on: agg_windows.count, expression: '',
        label: Sum of Count, type: sum, _kind_hint: measure, _type_hint: number}]
    value_labels: labels
    label_type: labPer
    series_types: {}
    defaults_version: 1
    listen: {}
    row: 7
    col: 16
    width: 8
    height: 6
  - title: Top 10 Logon and Logoff Users
    name: Top 10 Logon and Logoff Users
    model: agg
    explore: agg_windows
    type: looker_pie
    fields: [agg_windows.entity2, agg_windows.Sum_of_Count]
    filters:
      agg_windows.eventid: '4648,4624,4647,4634,4625'
      agg_windows.entity2: "-NULL,--"
    limit: 10
    dynamic_fields: [{measure: sum_of_count, based_on: agg_windows.count, expression: '',
        label: Sum of Count, type: sum, _kind_hint: measure, _type_hint: number}]
    value_labels: labels
    label_type: labPer
    series_types: {}
    defaults_version: 1
    listen: {}
    row: 13
    col: 0
    width: 8
    height: 6
  - title: Logoff Summary
    name: Logoff Summary
    model: agg
    explore: agg_windows
    type: looker_pie
    fields: [agg_windows.type, agg_windows.Sum_of_Count]
    filters:
      agg_windows.eventid: '4648,4647,4634,4625'
    limit: 500
    dynamic_fields: [{measure: sum_of_count, based_on: agg_windows.count, expression: '',
        label: Sum of Count, type: sum, _kind_hint: measure, _type_hint: number}]
    value_labels: labels
    label_type: labPer
    series_types: {}
    defaults_version: 1
    listen: {}
    row: 21
    col: 0
    width: 8
    height: 6
  - title: Logoff Trends
    name: Logoff Trends
    model: agg
    explore: agg_windows
    type: looker_line
    fields: [agg_windows.type, agg_windows.date_date, agg_windows.Sum_of_Count]
    pivots: [agg_windows.type]
    fill_fields: [agg_windows.date_date]
    filters:
      agg_windows.eventid: '4648,4647,4634,4625'
    sorts: [agg_windows.type]
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
    value_labels: legend
    label_type: labPer
    defaults_version: 1
    listen: {}
    row: 21
    col: 8
    width: 8
    height: 6
  - title: Top 10 Logoff Hosts
    name: Top 10 Logoff Hosts
    model: agg
    explore: agg_windows
    type: looker_pie
    fields: [agg_windows.entity1, agg_windows.Sum_of_Count]
    filters:
      agg_windows.eventid: '4648,4647,4634,4625'
      agg_windows.entity2: "-NULL,--"
    limit: 10
    dynamic_fields: [{measure: sum_of_count, based_on: agg_windows.count, expression: '',
        label: Sum of Count, type: sum, _kind_hint: measure, _type_hint: number}]
    value_labels: labels
    label_type: labPer
    series_types: {}
    defaults_version: 1
    listen: {}
    row: 21
    col: 16
    width: 8
    height: 6
  - title: Top 10 Logoff Users
    name: Top 10 Logoff Users
    model: agg
    explore: agg_windows
    type: looker_pie
    fields: [agg_windows.entity2, agg_windows.Sum_of_Count]
    filters:
      agg_windows.eventid: '4648,4624,4647,4634,4625'
      agg_windows.entity2: "-NULL,--"
    limit: 10
    dynamic_fields: [{measure: sum_of_count, based_on: agg_windows.count, expression: '',
        label: Sum of Count, type: sum, _kind_hint: measure, _type_hint: number}]
    value_labels: labels
    label_type: labPer
    series_types: {}
    defaults_version: 1
    listen: {}
    row: 27
    col: 0
    width: 8
    height: 6
  - title: File and Directory Change Event Trends
    name: File and Directory Change Event Trends
    model: agg
    explore: agg_windows
    type: looker_line
    fields: [agg_windows.date_date, agg_windows.ActionType, agg_windows.Sum_of_Count]
    pivots: [agg_windows.ActionType]
    fill_fields: [agg_windows.date_date]
    filters:
      agg_windows.eventid: '4720,4741,609,4705,625,642,685,4738,4742,4781'
    sorts: [agg_windows.date_date desc, agg_windows.ActionType]
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
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    listen: {}
    row: 35
    col: 8
    width: 8
    height: 6
  - title: File and Directory Change Event Trends (copy)
    name: File and Directory Change Event Trends (copy)
    model: agg
    explore: agg_windows
    type: looker_column
    fields: [agg_windows.ActionType, agg_windows.Sum_of_Count]
    filters:
      agg_windows.eventid: '532,535,531,629,4725,577,578,4672,4673'
    sorts: [sum_of_count desc]
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
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    show_null_points: true
    interpolation: linear
    series_types: {}
    defaults_version: 1
    listen: {}
    row: 35
    col: 16
    width: 8
    height: 6
  - title: User Access and Least Privilege Compliance Checks
    name: User Access and Least Privilege Compliance Checks (2)
    model: agg
    explore: agg_windows
    type: looker_line
    fields: [agg_windows.date_date, agg_windows.ActionType, agg_windows.Sum_of_Count]
    pivots: [agg_windows.ActionType]
    fill_fields: [agg_windows.date_date]
    filters:
      agg_windows.eventid: '4723,4724,4794,627,628'
    sorts: [agg_windows.date_date desc, agg_windows.ActionType]
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
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    listen: {}
    row: 47
    col: 0
    width: 12
    height: 6
  - title: Suspicious Access Activity
    name: Suspicious Access Activity
    model: agg
    explore: suspicious_access_activity
    type: looker_pie
    fields: [suspicious_access_activity.actiontype, suspicious_access_activity.Sum_of_sumcount]
    limit: 500
    dynamic_fields: [{measure: sum_of_sumcount, based_on: suspicious_access_activity.sumcount,
        expression: '', label: Sum of Sumcount, type: sum, _kind_hint: measure, _type_hint: number}]
    value_labels: labels
    label_type: labPer
    series_types: {}
    defaults_version: 1
    listen: {}
    row: 47
    col: 12
    width: 12
    height: 6
  - title: Administrative Activities Summary
    name: Administrative Activities Summary
    model: agg
    explore: agg_windows
    type: looker_pie
    fields: [agg_windows.type, agg_windows.Sum_of_Count]
    filters:
      agg_windows.eventid: '4726,644,4740,4738,4720,4704,630,624'
    limit: 500
    dynamic_fields: [{measure: sum_of_count, based_on: agg_windows.count, expression: '',
        label: Sum of Count, type: sum, _kind_hint: measure, _type_hint: number}]
    value_labels: labels
    label_type: labPer
    series_types: {}
    defaults_version: 1
    listen: {}
    row: 56
    col: 0
    width: 8
    height: 6
  - title: Administrative Activities Trends
    name: Administrative Activities Trends
    model: agg
    explore: agg_windows
    type: looker_line
    fields: [agg_windows.type, agg_windows.date_date, agg_windows.Sum_of_Count]
    pivots: [agg_windows.type]
    fill_fields: [agg_windows.date_date]
    filters:
      agg_windows.eventid: '4726,644,4740,4738,4720,4704,630,624'
    sorts: [agg_windows.type]
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
    value_labels: legend
    label_type: labPer
    defaults_version: 1
    listen: {}
    row: 56
    col: 8
    width: 8
    height: 6
  - title: Top 10 Administrative Activities Users
    name: Top 10 Administrative Activities Users
    model: agg
    explore: agg_windows
    type: looker_pie
    fields: [agg_windows.entity2, agg_windows.Sum_of_Count]
    filters:
      agg_windows.entity2: "-NULL,--"
      agg_windows.eventid: '4726,644,4740,4738,4720,4704,630,624'
    limit: 10
    dynamic_fields: [{measure: sum_of_count, based_on: agg_windows.count, expression: '',
        label: Sum of Count, type: sum, _kind_hint: measure, _type_hint: number}]
    value_labels: labels
    label_type: labPer
    series_types: {}
    defaults_version: 1
    listen: {}
    row: 56
    col: 16
    width: 8
    height: 6
  - title: Top 10 Administrative Activities Hosts
    name: Top 10 Administrative Activities Hosts
    model: agg
    explore: agg_windows
    type: looker_pie
    fields: [agg_windows.entity1, agg_windows.Sum_of_Count]
    filters:
      agg_windows.entity2: "-NULL,--"
      agg_windows.eventid: '4726,644,4740,4738,4720,4704,630,624'
    limit: 10
    dynamic_fields: [{measure: sum_of_count, based_on: agg_windows.count, expression: '',
        label: Sum of Count, type: sum, _kind_hint: measure, _type_hint: number}]
    value_labels: labels
    label_type: labPer
    series_types: {}
    defaults_version: 1
    listen: {}
    row: 62
    col: 0
    width: 8
    height: 6
  - title: Activity Summary/Top Continuous  Events
    name: Activity Summary/Top Continuous  Events
    model: agg
    explore: agg_watchguard_proxy
    type: looker_line
    fields: [agg_watchguard_proxy.type, agg_watchguard_proxy.date_date, agg_watchguard_proxy.Sum_of_Count]
    pivots: [agg_watchguard_proxy.type]
    fill_fields: [agg_watchguard_proxy.date_date]
    filters:
      agg_watchguard_proxy.type: Log type count
    sorts: [agg_watchguard_proxy.date_date desc, agg_watchguard_proxy.type]
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
    series_types: {}
    defaults_version: 1
    listen: {}
    row: 71
    col: 0
    width: 12
    height: 6
  - title: Top 10 Talkers by IP Address
    name: Top 10 Talkers by IP Address
    model: agg
    explore: agg_watchguard_proxy
    type: looker_line
    fields: [agg_watchguard_proxy.date_date, agg_watchguard_proxy.entity1, agg_watchguard_proxy.source,
      agg_watchguard_proxy.Sum_of_Count]
    pivots: [agg_watchguard_proxy.entity1, agg_watchguard_proxy.source]
    fill_fields: [agg_watchguard_proxy.date_date]
    filters:
      agg_watchguard_proxy.type: Log type count
    sorts: [agg_watchguard_proxy.date_date desc, agg_watchguard_proxy.entity1, agg_watchguard_proxy.source]
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
    series_types: {}
    defaults_version: 1
    listen: {}
    row: 71
    col: 12
    width: 12
    height: 6
