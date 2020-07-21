- dashboard: nist_cyber_security_framework_part_2
  title: NIST Cyber Security Framework Part 2
  layout: newspaper
  elements:
  - title: User Access & Least Privilege(Host Alerts by User)
    name: User Access & Least Privilege(Host Alerts by User)
    model: agg
    explore: agg_watchguard_proxy
    type: looker_grid
    fields: [agg_watchguard_proxy.type, agg_watchguard_proxy.count, agg_watchguard_proxy.date_date,
      agg_watchguard_proxy.hour, agg_watchguard_proxy.m, agg_watchguard_proxy.entity1,
      agg_watchguard_proxy.entity2]
    filters:
      datefilter: 'Yes'
    sorts: [agg_watchguard_proxy.date_date desc]
    limit: 500
    dynamic_fields: [{dimension: datefilter, label: DateFilter, expression: 'matches_filter(${agg_watchguard_proxy.date_date},`last
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
    series_types: {}
    defaults_version: 1
    row: 8
    col: 0
    width: 8
    height: 6
  - title: Windows Account and Group Information
    name: Windows Account and Group Information
    model: agg
    explore: windows_account_and_group_information
    type: looker_grid
    fields: [windows_account_and_group_information.eventid, windows_account_and_group_information.type,
      sum_of_count]
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
    series_types: {}
    defaults_version: 1
    row: 20
    col: 0
    width: 8
    height: 6
  - title: File Integrity Monitoring
    name: File Integrity Monitoring
    model: agg
    explore: agg_windows
    type: looker_line
    fields: [agg_windows.date_date]
    fill_fields: [agg_windows.date_date]
    sorts: [agg_windows.date_date desc]
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
    defaults_version: 1
    row: 20
    col: 8
    width: 16
    height: 6
  - title: File and Directory Change Event
    name: File and Directory Change Event
    model: agg
    explore: agg_windows
    type: looker_grid
    fields: [agg_windows.eventid, agg_windows.date_date, agg_windows.hour, agg_windows.entity1,
      agg_windows.entity2, agg_windows.type]
    filters:
      agg_windows.type: File
      agg_windows.eventid: '4656,4658,4659,4660,4663,4664,4670,4691,4907'
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
    column_order: ["$$$_row_numbers_$$$", agg_windows.eventid, agg_windows.type, agg_windows.date_date,
      agg_windows.hour, agg_windows.entity1, agg_windows.entity2]
    show_totals: true
    show_row_totals: true
    series_labels:
      agg_windows.entity1: Host
      agg_windows.entity2: SourceUser
    series_types: {}
    defaults_version: 1
    listen: {}
    row: 37
    col: 8
    width: 16
    height: 6
  - title: Subnet B class
    name: Subnet B class
    model: agg
    explore: agg_watchguard_proxy
    type: looker_grid
    fields: [sum_of_count, agg_watchguard_proxy.entity1]
    filters:
      agg_watchguard_proxy.type: Source IP Count
      agg_watchguard_proxy.entity1: 0.0%
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
    listen: {}
    row: 77
    col: 0
    width: 8
    height: 6
  - title: Subnet C class
    name: Subnet C class
    model: agg
    explore: agg_watchguard_proxy
    type: looker_grid
    fields: [sum_of_count, agg_watchguard_proxy.entity1]
    filters:
      agg_watchguard_proxy.type: Source IP Count
      agg_watchguard_proxy.entity1: 0%
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
    listen: {}
    row: 77
    col: 8
    width: 8
    height: 6
  - title: Port Usage
    name: Port Usage
    model: agg
    explore: agg_watchguard_proxy
    type: looker_grid
    fields: [sum_of_count, agg_watchguard_proxy.entity1]
    filters:
      agg_watchguard_proxy.type: Source Port Count,Destination Port Count
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
    listen: {}
    row: 77
    col: 16
    width: 8
    height: 6
  - name: User Access and Least Privilege
    type: text
    title_text: User Access and Least Privilege
    body_text: |-
      **User Access and Least Privilege (PR.AC-1, PR.AC-4)

      User account management, access control, and enforcement of least privilege are critical to effective network security. Without these, the risk of network intrusion and compromise, insider activity, and data loss is increased. This dashboard deals with user account management, credential management, and least privilege.**
    row: 4
    col: 0
    width: 24
    height: 4
  - name: User Access and Least Privileges
    type: text
    title_text: User Access and Least Privileges
    body_text: "- **User Access and Least Privileges**\n\n- **File Integrity Monitoring**\n\
      \n- **Change Control**  \n\n- **Boundary Defenses**"
    row: 0
    col: 0
    width: 24
    height: 4
  - name: Change Control
    type: text
    title_text: Change Control
    body_text: "Change Control (PR.IP-3) \n\nChanges are a part of the dynamic nature\
      \ of networks that are continually being made to keep up with business demands.\
      \ However, the lack of a proper change control process can be a costly expense\
      \ that can lead to network outages, along with devices and servers being compromised.\
      \ The Change Control Dashboard can assist the organization by detecting changes\
      \ on servers, infrastructure devices, users, software and more"
    row: 55
    col: 0
    width: 24
    height: 5
  - name: Boundary Defenses
    type: text
    title_text: Boundary Defenses
    body_text: "Boundary Defenses (PR.AC-5) \n\nOrganizations today can no longer\
      \ afford to rely on conventional network defense devices to monitor and protect\
      \ a network, both internally and externally. The lack of a multi-layered security\
      \ strategy across each network segment could lead to intrusions and persistent\
      \ threats. This dashboard displays information from network security devices\
      \ and services."
    row: 66
    col: 0
    width: 24
    height: 5
  - name: File Integrity Monitoring (2)
    type: text
    title_text: File Integrity Monitoring
    body_text: "File Integrity Monitoring (PR.DS-6) \n\nMost organizations today deploy\
      \ and utilize a wide variety of hosts and devices, which becomes problematic\
      \ for analysts to keep track of and manage properly. Gaps in the continuous\
      \ monitoring of devices and assets can lead to an increased risk of unknown\
      \ or rogue devices infiltrating a network. This dashboard which identifies,\
      \ categorizes, and tracks multiple types of new and existing network devices\
      \ and assets."
    row: 26
    col: 0
    width: 24
    height: 5
  - title: User Access and Least Privilege Compliance Checks
    name: User Access and Least Privilege Compliance Checks
    model: agg
    explore: agg_windows
    type: looker_grid
    fields: [agg_windows.date_date, agg_windows.ActionType3, agg_windows.hour, agg_windows.type,
      agg_windows.eventid, average_of_count]
    filters:
      agg_windows.date_date: 30 days
      agg_windows.ActionType3: Account,Credentials,Password
    sorts: [agg_windows.date_date desc]
    limit: 500
    total: true
    dynamic_fields: [{measure: average_of_count, based_on: agg_windows.count, type: average,
        label: Average of Count, expression: !!null '', _kind_hint: measure, _type_hint: number}]
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
      average_of_count: Total Avg
    series_cell_visualizations:
      average_of_count:
        is_active: true
    series_value_format:
      average_of_count:
        name: decimal_2
        format_string: "#,##0.00"
        label: Decimals (2)
    series_types: {}
    defaults_version: 1
    row: 14
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
      agg_windows.date_date: 30 days
      agg_windows.ActionType: User Add,User Changed,User Removed
    sorts: [agg_windows.date_date desc, agg_windows.ActionType]
    limit: 500
    dynamic_fields: [{measure: sum_of_count, based_on: agg_windows.count, expression: '',
        label: Sum of Count, type: sum, _kind_hint: measure, _type_hint: number},
      {measure: sum_of_count_2, based_on: agg_windows.count, expression: '', label: Sum
          of Count, type: sum, _kind_hint: measure, _type_hint: number}]
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
    series_labels: {}
    defaults_version: 1
    listen: {}
    row: 8
    col: 8
    width: 8
    height: 6
  - title: Access Information and Changes
    name: Access Information and Changes
    model: agg
    explore: agg_windows
    type: looker_column
    fields: [agg_windows.ActionType2, agg_windows.Count_of_Count]
    filters:
      agg_windows.date_date: 30 days
      agg_windows.ActionType2: FirstLogin,Changed Privileges,Account Disabled,Account
        Expired
    limit: 500
    dynamic_fields: [{measure: sum_of_count, based_on: agg_windows.count, expression: '',
        label: Sum of Count, type: sum, _kind_hint: measure, _type_hint: number},
      {measure: count_of_count, based_on: agg_windows.count, expression: '', label: Count
          of Count, type: count_distinct, _kind_hint: measure, _type_hint: number}]
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
    series_types: {}
    series_labels:
      count_of_count: Count
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    listen: {}
    row: 8
    col: 16
    width: 8
    height: 6
  - title: User Access and Least Privilege Compliance Checks
    name: User Access and Least Privilege Compliance Checks (2)
    model: agg
    explore: agg_windows
    type: looker_line
    fields: [agg_windows.date_date, agg_windows.ActionType3, agg_windows.Sum_of_Count]
    pivots: [agg_windows.ActionType3]
    fill_fields: [agg_windows.date_date]
    filters:
      agg_windows.date_date: 30 days
      agg_windows.eventid: '4723,4724,4794,627,628'
      agg_windows.ActionType3: Account,Credentials,Password
    sorts: [agg_windows.date_date desc, agg_windows.ActionType3]
    limit: 500
    dynamic_fields: [{measure: sum_of_count, based_on: agg_windows.count, expression: '',
        label: Sum of Count, type: sum, _kind_hint: measure, _type_hint: number},
      {measure: sum_of_count_2, based_on: agg_windows.count, expression: '', label: Sum
          of Count, type: sum, _kind_hint: measure, _type_hint: number}]
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
    series_labels: {}
    defaults_version: 1
    listen: {}
    row: 14
    col: 8
    width: 8
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
    value_labels: legend
    label_type: labPer
    series_types: {}
    defaults_version: 1
    listen: {}
    row: 14
    col: 16
    width: 8
    height: 6
  - title: File Integrity(File and Directory  Event Summary)
    name: File Integrity(File and Directory  Event Summary)
    model: agg
    explore: agg_windows
    type: looker_pie
    fields: [agg_windows.eventid, agg_windows.Sum_of_Count]
    filters:
      agg_windows.type: File
      agg_windows.eventid: '4656,4658,4659,4660,4663,4664,4670,4691,4907'
    limit: 500
    dynamic_fields: [{measure: sum_of_count, based_on: agg_windows.count, expression: '',
        label: Sum of Count, type: sum, _kind_hint: measure, _type_hint: number}]
    value_labels: labels
    label_type: labPer
    series_types: {}
    defaults_version: 1
    listen: {}
    row: 31
    col: 0
    width: 8
    height: 6
  - title: File and Directory Change Event Trends
    name: File and Directory Change Event Trends (2)
    model: agg
    explore: agg_windows
    type: looker_line
    fields: [agg_windows.type, agg_windows.date_date, agg_windows.Sum_of_Count]
    pivots: [agg_windows.type]
    fill_fields: [agg_windows.date_date]
    filters:
      agg_windows.type: File
      agg_windows.eventid: '4656,4658,4659,4660,4663,4664,4670,4691,4907'
    sorts: [agg_windows.type, agg_windows.date_date desc]
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
    row: 31
    col: 8
    width: 8
    height: 6
  - title: Top 10 Changes
    name: Top 10 Changes
    model: agg
    explore: agg_windows
    type: looker_pie
    fields: [agg_windows.entity1, agg_windows.Sum_of_Count]
    filters:
      agg_windows.type: File
      agg_windows.eventid: '4656,4658,4659,4660,4663,4664,4670,4691,4907'
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
    row: 31
    col: 16
    width: 8
    height: 6
  - title: Top 10 User Activities
    name: Top 10 User Activities
    model: agg
    explore: agg_windows
    type: looker_pie
    fields: [agg_windows.entity2, agg_windows.Sum_of_Count]
    filters:
      agg_windows.type: File
      agg_windows.eventid: '4656,4658,4659,4660,4663,4664,4670,4691,4907'
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
    row: 37
    col: 0
    width: 8
    height: 6
  - title: Network Errors
    name: Network Errors
    model: agg
    explore: agg_watchguard_proxy
    type: looker_column
    fields: [agg_watchguard_proxy.entity1, agg_watchguard_proxy.Sum_of_Count]
    pivots: [agg_watchguard_proxy.entity1]
    filters:
      agg_watchguard_proxy.type: Protocol Count
      agg_watchguard_proxy.entity1: "%icmp%"
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
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
    show_null_points: true
    interpolation: linear
    listen: {}
    row: 43
    col: 8
    width: 8
    height: 6
  - title: Hosts Observed
    name: Hosts Observed
    model: agg
    explore: agg_windows
    type: looker_column
    fields: [agg_windows.entity1, agg_windows.date_date, agg_windows.Sum_of_Count]
    pivots: [agg_windows.entity1]
    fill_fields: [agg_windows.date_date]
    sorts: [agg_windows.date_date desc, agg_windows.entity1]
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
    series_types: {}
    defaults_version: 1
    listen: {}
    row: 43
    col: 16
    width: 8
    height: 6
  - title: Change Control(Daily Usage Summary)
    name: Change Control(Daily Usage Summary)
    model: agg
    explore: agg_windows
    type: looker_pie
    fields: [agg_windows.eventid, agg_windows.Sum_of_Count]
    limit: 15
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
    row: 49
    col: 0
    width: 13
    height: 6
  - title: CSF-UserChanges
    name: CSF-UserChanges
    model: agg
    explore: agg_windows
    type: looker_column
    fields: [agg_windows.type, agg_windows.Sum_of_Count]
    filters:
      agg_windows.type: User right assigned,User account unlocked,User account locked
        out,User account deleted,User account changed,User account added,Member removed
        from global security,Member added to global security group,Global security
        group changed
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
    defaults_version: 1
    listen: {}
    row: 49
    col: 13
    width: 11
    height: 6
  - title: Network changes
    name: Network changes
    model: agg
    explore: agg_watchguard_proxy
    type: looker_line
    fields: [agg_watchguard_proxy.date_date, agg_watchguard_proxy.entity1, agg_watchguard_proxy.Sum_of_Count]
    pivots: [agg_watchguard_proxy.entity1]
    fill_fields: [agg_watchguard_proxy.date_date]
    filters:
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
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
    listen: {}
    row: 60
    col: 0
    width: 13
    height: 6
  - title: Detected Network Spikes Last 7 Days
    name: Detected Network Spikes Last 7 Days
    model: agg
    explore: agg_watchguard_proxy
    type: looker_column
    fields: [agg_watchguard_proxy.date_date, agg_watchguard_proxy.Sum_of_Count]
    fill_fields: [agg_watchguard_proxy.date_date]
    sorts: [agg_watchguard_proxy.date_date desc]
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
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    listen: {}
    row: 60
    col: 13
    width: 11
    height: 6
  - title: IDS TREND OUTBOUND
    name: IDS TREND OUTBOUND
    model: agg
    explore: agg_watchguard_proxy
    type: looker_line
    fields: [agg_watchguard_proxy.date_date, agg_watchguard_proxy.entity2, agg_watchguard_proxy.Sum_of_Count]
    pivots: [agg_watchguard_proxy.entity2]
    fill_fields: [agg_watchguard_proxy.date_date]
    filters:
      agg_watchguard_proxy.type: Destination Port Count
      agg_watchguard_proxy.entity2: 0-External
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
    series_labels:
      0-External - sum_of_count: Outbound
    defaults_version: 1
    listen: {}
    row: 71
    col: 0
    width: 13
    height: 6
  - title: IDS TREND INBOUND
    name: IDS TREND INBOUND
    model: agg
    explore: agg_watchguard_proxy
    type: looker_line
    fields: [agg_watchguard_proxy.date_date, agg_watchguard_proxy.source, agg_watchguard_proxy.Sum_of_Count]
    pivots: [agg_watchguard_proxy.source]
    fill_fields: [agg_watchguard_proxy.date_date]
    filters:
      agg_watchguard_proxy.type: Msg Count
      agg_watchguard_proxy.entity2: 0-External
    sorts: [agg_watchguard_proxy.date_date desc, agg_watchguard_proxy.source]
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
    series_labels:
      0-External - sum_of_count: Inbound
    defaults_version: 1
    listen: {}
    row: 71
    col: 13
    width: 11
    height: 6
  - title: Ip Addresses
    name: Ip Addresses
    model: odm
    explore: wgtraffic_odm
    type: looker_column
    fields: [wgtraffic_odm.src_ip, wgtraffic_odm.Count_Of_event_time_time]
    filters:
      wgtraffic_odm.event_time_date: 7 days
    limit: 500
    dynamic_fields: [{measure: count_of_event_time_time, based_on: wgtraffic_odm.event_time_time,
        expression: '', label: Count of Event Time Time, type: count_distinct, _kind_hint: measure,
        _type_hint: number}]
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
    listen: {}
    row: 43
    col: 0
    width: 8
    height: 6
