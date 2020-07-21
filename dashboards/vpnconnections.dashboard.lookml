- dashboard: vpn_connections
  title: VPN Connections
  layout: newspaper
  elements:
  - title: COUNT OF USERS
    name: COUNT OF USERS
    model: ueba
    explore: ueba_vpn_session
    type: single_value
    fields: [ueba_vpn_session.Count_of_id]
    filters: {}
    limit: 500
    dynamic_fields: [{measure: count_users, based_on: ueba_vpn_session.id, type: count_distinct,
        label: Count_Users, expression: !!null '', value_format: !!null '', value_format_name: !!null '',
        _kind_hint: measure, _type_hint: number}]
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: Count Of Users
    defaults_version: 1
    series_types: {}
    listen:
      Event Date: ueba_vpn_session.datefilter
    row: 0
    col: 0
    width: 5
    height: 5
  - name: INFORMATION
    type: text
    title_text: INFORMATION
    subtitle_text: ''
    body_text: |-
      <html>
      <body style="background-color:#FF0000;">
      <font color="#585b88" size="2"><b> ALGORITHM USED:</b></font>
      <li><font color="#585b88" size="2">Isolation Forest</font></li>
      <li><font color="#585b88" size="2">K-means</font></li>
      <li><font color="#585b88" size="2">One Class SVM</font></li>
      <font color="#585b88" size="2"><b>ANOMALY SCORE RANGE:</b></font><br>
      <font color="#585b88" size="2"> 0(least anomalous) to 100 (most anomalous)</font><br>
      <font color="#585b88" size="2"><b>ANOMALY OUTLIERS THRESHOLD:</b></font><br>
      <font color="#585b88" size="2">Anomaly score of > 80 (Level 3); 60-80 (Level 2) ; 40-60 (Level 1) ; <40 (Level 0)</font><br>
      <font color="#585b88" size="2"><b>X-axis(Deviating Distance)</b> - Avg Distance of Geo-locations between Sessions</font><br>
      <font color="#585b88" size="2"><b>Y-axis(No of SESSIONS)</b>-Total No of Sessions</font>
      </html>
      </body>
    row: 0
    col: 5
    width: 10
    height: 5
  - title: OUTLIERS
    name: OUTLIERS
    model: ueba
    explore: ueba_vpn_session
    type: looker_pie
    fields: [ueba_vpn_session.level, ueba_vpn_session.count]
    filters: {}
    sorts: [ueba_vpn_session.count desc, ueba_vpn_session.level]
    limit: 500
    value_labels: labels
    label_type: labPer
    inner_radius: 50
    start_angle: 90
    series_colors:
      '0': "#75E2E2"
      '1': "#FFD95F"
      '2': "#E57947"
      '3': "#e64133"
    series_labels: {}
    show_value_labels: false
    font_size: 12
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
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    defaults_version: 1
    series_types: {}
    listen:
      Event Date: ueba_vpn_session.datefilter
    row: 0
    col: 15
    width: 9
    height: 5
  - title: Details VPN Connections
    name: Details VPN Connections
    model: ueba
    explore: ueba_vpn_session
    type: looker_scatter
    fields: [ueba_vpn_session.deviating_distance, ueba_vpn_session.No_of_Sessions_and_name,
      ueba_vpn_session.score, ueba_vpn_session.event_date, ueba_vpn_session.id]
    filters: {}
    sorts: [ueba_vpn_session.event_date desc]
    limit: 500
    dynamic_fields: [{measure: average_of_deviating_distance, based_on: ueba_vpn_session.deviating_distance,
        expression: '', label: Average of Deviating Distance, type: average, _kind_hint: measure,
        _type_hint: number}, {measure: average_of_no_of_sessions, based_on: ueba_vpn_session.no_of_sessions,
        expression: '', label: Average of No of Sessions, type: average, _kind_hint: measure,
        _type_hint: number}, {measure: average_of_score, based_on: ueba_vpn_session.score,
        expression: '', label: Average of Score, type: average, _kind_hint: measure,
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
    point_style: circle_outline
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    color_application:
      collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
      palette_id: fb7bb53e-b77b-4ab6-8274-9d420d3d73f3
      options:
        steps: 5
    y_axes: [{label: '', orientation: left, series: [{axisId: ueba_vpn_session.deviating_distance,
            id: ueba_vpn_session.deviating_distance, name: Deviating Distance}], showLabels: true,
        showValues: true, valueFormat: '', unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    size_by_field: ueba_vpn_session.score
    hide_legend: true
    series_types: {}
    series_colors:
      ueba_vpn_session.id: "#3EB0D5"
      ueba_vpn_session.deviating_distance: "#E57947"
    series_labels: {}
    x_axis_datetime_label: Point
    swap_axes: false
    hidden_fields:
    hidden_points_if_no: []
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
    defaults_version: 1
    note_state: expanded
    note_display: above
    note_text: Bubble Size Is Based On Score
    listen:
      Event Date: ueba_vpn_session.datefilter
    row: 5
    col: 0
    width: 24
    height: 8
  filters:
  - name: Event Date
    title: Event Date
    type: date_filter
    default_value: 15 days
    allow_multiple_values: true
    required: false
