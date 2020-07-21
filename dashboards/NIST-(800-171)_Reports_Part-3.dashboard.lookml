- dashboard: nist800171_reports_part3
  title: NIST-(800-171) Reports Part-3
  layout: newspaper
  elements:
  - name: SI
    type: text
    title_text: SI
    body_text: |-
      <html>
      <body style="background-color:#FF0000;">
      <font color="#585b88" size="2"><b><u> SYSTEM AND INFORMATION INTEGRITY</u></b></font>
      <li><font color="#585b88" size="2">Email Reports</font></li>
      <li><font color="#585b88" size="2">Watchguard DHCP Reports</font></li>
      <li><font color="#585b88" size="2">Watchguard Proxy Reports</font></li>
      </html>
      </body>
    row: 0
    col: 0
    width: 24
    height: 3
  - name: Email
    type: text
    title_text: Email
    body_text: |-
      <html>
      <body style="background-color:#FF0000;">
      <font color="#585b88" size="2"><b> Email Reports (SI-2; SI-3; SI-4; SI-5)</b></font>
      </html>
      </body>
    row: 3
    col: 0
    width: 24
    height: 2
  - title: Details
    name: Details
    model: agg
    explore: agg_email
    type: looker_grid
    fields: [agg_email.d, agg_email.date_hour, agg_email.entity1, agg_email.entity2,
      agg_email.hour, agg_email.m, agg_email.source, agg_email.type, agg_email.y,
      sum_of_count]
    filters: {}
    sorts: [agg_email.date_hour desc]
    limit: 500
    dynamic_fields: [{measure: sum_of_count, based_on: agg_email.count, expression: '',
        label: Sum of Count, type: sum, _kind_hint: measure, _type_hint: number}]
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: gray
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
        is_active: false
    series_types: {}
    defaults_version: 1
    listen:
      Event Date: agg_email.date_date
    row: 17
    col: 12
    width: 12
    height: 6
  - name: Watchguard DHCP Reports
    type: text
    title_text: Watchguard DHCP Reports
    body_text: |-
      <html>
      <body style="background-color:#FF0000;">
      <font color="#585b88" size="2"><b>Watchguard DHCP Reports (SI-2; SI-3; SI-4; SI-5)
      </b></font>
      </html>
      </body>
    row: 23
    col: 0
    width: 24
    height: 2
  - name: Watchguard Proxy Reports
    type: text
    title_text: Watchguard Proxy Reports
    body_text: |-
      <html>
      <body style="background-color:#FF0000;">
      <font color="#585b88" size="2"><b>Watchguard Proxy Reports (SI-2; SI-3; SI-4; SI-5)
      </b></font>
      </html>
      </body>
    row: 36
    col: 0
    width: 24
    height: 2
  - title: WatchGuard Dhcp Summary
    name: WatchGuard Dhcp Summary
    model: odm
    explore: wgevent_odm
    type: looker_pie
    fields: [wgevent_odm.event_id, wgevent_odm.count]
    filters:
      wgevent_odm.event_id: '16000065,16000002'
      wgevent_odm.src_ip: "-EMPTY"
      wgevent_odm.raw: "-EMPTY"
    sorts: [wgevent_odm.count desc]
    limit: 25
    value_labels: labels
    label_type: labPer
    series_types: {}
    defaults_version: 1
    listen:
      Event Date: wgevent_odm.event_time_date
    row: 25
    col: 0
    width: 12
    height: 5
  - title: DHCP Trends
    name: DHCP Trends
    model: odm
    explore: wgevent_odm
    type: looker_line
    fields: [wgevent_odm.event_id, wgevent_odm.count, wgevent_odm.event_time_date]
    pivots: [wgevent_odm.event_id]
    fill_fields: [wgevent_odm.event_time_date]
    filters:
      wgevent_odm.event_id: '16000065,16000002'
      wgevent_odm.src_ip: "-EMPTY"
      wgevent_odm.raw: "-EMPTY"
    sorts: [wgevent_odm.count desc 0]
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
    value_labels: labels
    label_type: labPer
    series_types: {}
    defaults_version: 1
    listen:
      Event Date: wgevent_odm.event_time_date
    row: 25
    col: 12
    width: 12
    height: 5
  - title: TOP 10 Workstations
    name: TOP 10 Workstations
    model: odm
    explore: wgevent_odm
    type: looker_pie
    fields: [wgevent_odm.count, wgevent_odm.src_host]
    filters:
      wgevent_odm.event_id: '16000065,16000002'
      wgevent_odm.src_ip: "-EMPTY"
      wgevent_odm.raw: "-EMPTY"
      wgevent_odm.src_host: "-NULL"
    sorts: [wgevent_odm.count desc]
    limit: 10
    value_labels: labels
    label_type: labPer
    series_types: {}
    defaults_version: 1
    listen:
      Event Date: wgevent_odm.event_time_date
    row: 30
    col: 0
    width: 12
    height: 6
  - title: TOP 10 IP'S
    name: TOP 10 IP'S
    model: odm
    explore: wgevent_odm
    type: looker_pie
    fields: [wgevent_odm.count, wgevent_odm.src_ip]
    filters:
      wgevent_odm.event_id: '16000065,16000002'
      wgevent_odm.src_ip: "-EMPTY"
      wgevent_odm.raw: "-EMPTY"
    sorts: [wgevent_odm.count desc]
    limit: 10
    value_labels: labels
    label_type: labPer
    series_types: {}
    defaults_version: 1
    listen:
      Event Date: wgevent_odm.event_time_date
    row: 30
    col: 12
    width: 12
    height: 6
  - title: Top 10 Email Users By Size
    name: Top 10 Email Users By Size
    model: agg
    explore: agg_email
    type: looker_pie
    fields: [agg_email.entity1, agg_email.Sum_of_Count]
    filters:
      agg_email.entity1: "-%Microsoft%"
      agg_email.type: Email by size
    limit: 10
    dynamic_fields: [{measure: sum_of_count, based_on: agg_email.count, expression: '',
        label: Sum of Count, type: sum, _kind_hint: measure, _type_hint: number}]
    value_labels: labels
    label_type: labPer
    start_angle: 120
    series_types: {}
    defaults_version: 1
    listen:
      Event Date: agg_email.date_date
    row: 5
    col: 0
    width: 12
    height: 6
  - title: Top 10 Email Users By Count
    name: Top 10 Email Users By Count
    model: agg
    explore: agg_email
    type: looker_column
    fields: [agg_email.entity1, agg_email.Sum_of_Count]
    filters:
      agg_email.entity1: "-NULL"
      agg_email.type: Sender
    limit: 10
    dynamic_fields: [{measure: sum_of_count, based_on: agg_email.count, expression: '',
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
    x_axis_label: Sender
    series_types: {}
    series_colors:
      sum_of_count: "#E57947"
    series_labels:
      sum_of_count: Count
    value_labels: labels
    label_type: labPer
    defaults_version: 1
    listen:
      Event Date: agg_email.date_date
    row: 5
    col: 12
    width: 12
    height: 6
  - title: TOP 10 Email Destination Domain
    name: TOP 10 Email Destination Domain
    model: agg
    explore: agg_email
    type: looker_column
    fields: [agg_email.entity1, agg_email.Sum_of_Count]
    filters:
      agg_email.type: Sender and destination
    limit: 10
    dynamic_fields: [{measure: sum_of_count, based_on: agg_email.count, expression: '',
        label: Sum of Count, type: sum, _kind_hint: measure, _type_hint: number},
      {measure: sum_of_count_2, based_on: agg_email.count, expression: '', label: Sum
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
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    x_axis_label: Sender
    series_types: {}
    series_colors:
      sum_of_count: "#E57947"
    series_labels:
      sum_of_count: Count
    value_labels: labels
    label_type: labPer
    defaults_version: 1
    listen:
      Event Date: agg_email.date_date
    row: 11
    col: 0
    width: 12
    height: 6
  - title: Event Data For Email
    name: Event Data For Email
    model: agg
    explore: agg_email
    type: looker_pie
    fields: [agg_email.entity1, agg_email.Sum_of_Count]
    filters:
      agg_email.type: Event name
    limit: 25
    dynamic_fields: [{measure: sum_of_count, based_on: agg_email.count, expression: '',
        label: Sum of Count, type: sum, _kind_hint: measure, _type_hint: number},
      {measure: sum_of_count_2, based_on: agg_email.count, expression: '', label: Sum
          of Count, type: sum, _kind_hint: measure, _type_hint: number}]
    value_labels: labels
    label_type: labPer
    inner_radius: 50
    start_angle: 90
    series_colors:
      sum_of_count: "#E57947"
    series_labels:
      sum_of_count: Count
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
    x_axis_label: Sender
    series_types: {}
    defaults_version: 1
    listen:
      Event Date: agg_email.date_date
    row: 11
    col: 12
    width: 12
    height: 6
  - title: Event Trends For Email
    name: Event Trends For Email
    model: agg
    explore: agg_email
    type: looker_line
    fields: [agg_email.date_date, agg_email.entity1, agg_email.Sum_of_Count]
    pivots: [agg_email.entity1]
    fill_fields: [agg_email.date_date]
    filters:
      agg_email.type: Event name
      agg_email.entity1: "-NULL"
    sorts: [agg_email.entity1]
    limit: 500
    dynamic_fields: [{measure: sum_of_count, based_on: agg_email.count, expression: '',
        label: Sum of Count, type: sum, _kind_hint: measure, _type_hint: number},
      {measure: sum_of_count_2, based_on: agg_email.count, expression: '', label: Sum
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
    y_axes: [{label: Count, orientation: left, series: [{axisId: sum_of_count, id: BADMAIL
              - sum_of_count, name: BADMAIL}, {axisId: sum_of_count, id: DEFER - sum_of_count,
            name: DEFER}, {axisId: sum_of_count, id: DELIVER - sum_of_count, name: DELIVER},
          {axisId: sum_of_count, id: DSN - sum_of_count, name: DSN}, {axisId: sum_of_count,
            id: DUPLICATEDELIVER - sum_of_count, name: DUPLICATEDELIVER}, {axisId: sum_of_count,
            id: EXPAND - sum_of_count, name: EXPAND}, {axisId: sum_of_count, id: FAIL
              - sum_of_count, name: FAIL}, {axisId: sum_of_count, id: RECEIVE - sum_of_count,
            name: RECEIVE}, {axisId: sum_of_count, id: REDIRECT - sum_of_count, name: REDIRECT},
          {axisId: sum_of_count, id: SEND - sum_of_count, name: SEND}, {axisId: sum_of_count,
            id: SUBMIT - sum_of_count, name: SUBMIT}, {axisId: sum_of_count, id: TRANSFER
              - sum_of_count, name: TRANSFER}], showLabels: true, showValues: true,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
    x_axis_label: Event Type
    series_types: {}
    series_colors:
      sum_of_count: "#E57947"
    series_labels:
      sum_of_count: Count
    value_labels: labels
    label_type: labPer
    start_angle: 90
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    listen:
      Event Date: agg_email.date_date
    row: 17
    col: 0
    width: 12
    height: 6
  - title: Watchguard Summary
    name: Watchguard Summary
    model: agg
    explore: agg_watchguard_proxy
    type: looker_pie
    fields: [agg_watchguard_proxy.entity1, agg_watchguard_proxy.Sum_of_Count]
    filters:
      agg_watchguard_proxy.type: Log type count
    limit: 25
    dynamic_fields: [{measure: sum_of_count, based_on: agg_watchguard_proxy.count,
        expression: '', label: Sum of Count, type: sum, _kind_hint: measure, _type_hint: number}]
    value_labels: labels
    label_type: labPer
    series_labels:
      tr: Traffic
    series_types: {}
    defaults_version: 1
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
    listen:
      Event Date: agg_watchguard_proxy.date_date
    row: 38
    col: 0
    width: 10
    height: 5
  - title: Watchguard Trend
    name: Watchguard Trend
    model: agg
    explore: agg_watchguard_proxy
    type: looker_line
    fields: [agg_watchguard_proxy.date_date, agg_watchguard_proxy.entity1, agg_watchguard_proxy.Count_of_Count]
    pivots: [agg_watchguard_proxy.entity1]
    fill_fields: [agg_watchguard_proxy.date_date]
    filters:
      agg_watchguard_proxy.type: Log type count
    sorts: [agg_watchguard_proxy.date_date desc, agg_watchguard_proxy.entity1]
    limit: 500
    dynamic_fields: [{measure: sum_of_count, based_on: agg_watchguard_proxy.count,
        expression: '', label: Sum of Count, type: sum, _kind_hint: measure, _type_hint: number},
      {measure: sum_of_count_2, based_on: agg_watchguard_proxy.count, expression: '',
        label: Sum of Count, type: sum, _kind_hint: measure, _type_hint: number},
      {measure: count_of_count, based_on: agg_watchguard_proxy.count, expression: '',
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
    point_style: circle
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    y_axes: [{label: Count of Records, orientation: left, series: [{axisId: count_of_count,
            id: tr - count_of_count, name: Traffic}], showLabels: true, showValues: true,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
    x_axis_label: Date -  Log Type
    series_types: {}
    series_labels:
      tr: Traffic
    value_labels: labels
    label_type: labPer
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
      Event Date: agg_watchguard_proxy.date_date
    row: 38
    col: 10
    width: 14
    height: 5
  - title: Top 10 Watchguard Destination IP's
    name: Top 10 Watchguard Destination IP's
    model: agg
    explore: agg_watchguard_proxy
    type: looker_pie
    fields: [agg_watchguard_proxy.entity1, agg_watchguard_proxy.Sum_of_Count]
    filters:
      agg_watchguard_proxy.entity1: "-NULL"
      agg_watchguard_proxy.type: Destination IP Count
    limit: 10
    dynamic_fields: [{measure: sum_of_count, based_on: agg_watchguard_proxy.count,
        expression: '', label: Sum of Count, type: sum, _kind_hint: measure, _type_hint: number}]
    value_labels: labels
    label_type: labPer
    start_angle: 40
    series_types: {}
    defaults_version: 1
    listen:
      Event Date: agg_watchguard_proxy.date_date
    row: 43
    col: 0
    width: 8
    height: 6
  - title: TOP 10 Watchguard Source IP's
    name: TOP 10 Watchguard Source IP's
    model: agg
    explore: agg_watchguard_proxy
    type: looker_pie
    fields: [agg_watchguard_proxy.entity1, agg_watchguard_proxy.Sum_of_Count]
    filters:
      agg_watchguard_proxy.entity1: "-NULL"
      agg_watchguard_proxy.type: Source IP Count
    limit: 10
    dynamic_fields: [{measure: sum_of_count, based_on: agg_watchguard_proxy.count,
        expression: '', label: Sum of Count, type: sum, _kind_hint: measure, _type_hint: number}]
    value_labels: labels
    label_type: labPer
    start_angle: 40
    series_types: {}
    defaults_version: 1
    listen:
      Event Date: agg_watchguard_proxy.date_date
    row: 43
    col: 8
    width: 8
    height: 6
  - title: Top 10 Watchguard Protocols
    name: Top 10 Watchguard Protocols
    model: agg
    explore: agg_watchguard_proxy
    type: looker_pie
    fields: [agg_watchguard_proxy.entity1, agg_watchguard_proxy.Sum_of_Count]
    filters:
      agg_watchguard_proxy.entity1: "-NULL"
      agg_watchguard_proxy.type: Protocol Count
    limit: 10
    dynamic_fields: [{measure: sum_of_count, based_on: agg_watchguard_proxy.count,
        expression: '', label: Sum of Count, type: sum, _kind_hint: measure, _type_hint: number}]
    value_labels: labels
    label_type: labPer
    start_angle:
    series_types: {}
    defaults_version: 1
    listen:
      Event Date: agg_watchguard_proxy.date_date
    row: 43
    col: 16
    width: 8
    height: 6
  filters:
  - name: Event Date
    title: Event Date
    type: date_filter
    default_value: 7 days
    allow_multiple_values: true
    required: false
