- dashboard: endpointindicatorsofcompromise
  title: Endpoint-Indicators-of-Compromise
  layout: newspaper
  elements:
  - title: Count
    name: Count
    model: ueba
    explore: ueba_endpoint_indicators
    type: single_value
    fields: [ueba_endpoint_indicators.Count_of_id]
    filters:
      ueba_endpoint_indicators.type: entity
    limit: 500
    dynamic_fields: [{measure: count_of_id, based_on: ueba_endpoint_indicators.id,
        type: count_distinct, label: Count of ID, expression: !!null '', _kind_hint: measure,
        _type_hint: number}]
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: Count of Source Ip's
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
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    listen:
      date: ueba_endpoint_indicators.datefilter
    row: 2
    col: 0
    width: 6
    height: 5
  - name: INFORMATION
    type: text
    title_text: INFORMATION
    body_text: |-
      <html>
      <body>
      <font color="#585b88" size="2"><b> ALGORITHM USED:</b></font>
      <li><font color="#585b88" size="2">Isolation Forest</font></li>
      <li><font color="#585b88" size="2">K-means</font></li>
      <li><font color="#585b88" size="2">One Class SVM</font></li>
      <font color="#585b88" size="2"><b>ANOMALY SCORE RANGE:</b></font><br>
      <font color="#585b88" size="2"> 0(least anomalous) to 100 (most anomalous)</font><br>
      <font color="#585b88" size="2"><b>ANOMALY OUTLIERS THRESHOLD:</b></font><br>
      <font color="#585b88" size="2">Anomaly score of > 80 (Level 3); 60-80 (Level 2) ; 40-60 (Level 1) ; <40 (Level 0)</font><br>
      <font color="#585b88" size="2"><b>X-axis(Sentbytes and Name)</b>-Average of Sent Bytes </font><br>
      <font color="#585b88" size="2"><b>Y-axis(Remote Count)</b>-Average of End Point Remote Count</font>
      </html>
      </body>
    row: 2
    col: 6
    width: 9
    height: 5
  - title: Outliers
    name: Outliers
    model: ueba
    explore: ueba_endpoint_indicators
    type: looker_donut_multiples
    fields: [ueba_endpoint_indicators.level, ueba_endpoint_indicators.count]
    pivots: [ueba_endpoint_indicators.level]
    filters:
      ueba_endpoint_indicators.type: entity
      ueba_endpoint_indicators.score: "[50, 100]"
    sorts: [ueba_endpoint_indicators.level]
    limit: 500
    show_value_labels: false
    font_size: 12
    series_colors:
      1 - ueba_endpoint_indicators.count: "#FFD95F"
      2 - ueba_endpoint_indicators.count: "#E57947"
      3 - ueba_endpoint_indicators.count: "#B32F37"
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
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
    listen:
      date: ueba_endpoint_indicators.datefilter
    row: 2
    col: 15
    width: 9
    height: 5
  - title: Details  Endpoint Indicators
    name: Details  Endpoint Indicators
    model: ueba
    explore: ueba_endpoint_indicators
    type: looker_scatter
    fields: [ueba_endpoint_indicators.remote_count, ueba_endpoint_indicators.sentbytes_and_name,
      ueba_endpoint_indicators.score, ueba_endpoint_indicators.event_date, ueba_endpoint_indicators.id]
    filters: {}
    sorts: [ueba_endpoint_indicators.event_date desc]
    limit: 500
    dynamic_fields: [{measure: sentbytesavg, based_on: ueba_endpoint_indicators.sentbytes,
        type: average, label: Sentbytes(Avg), expression: !!null '', value_format: !!null '',
        value_format_name: !!null '', _kind_hint: measure, _type_hint: number}, {
        measure: scoreavg, based_on: ueba_endpoint_indicators.score, type: average,
        label: Score(Avg), expression: !!null '', value_format: !!null '', value_format_name: !!null '',
        _kind_hint: measure, _type_hint: number}, {measure: remote_countavg, based_on: ueba_endpoint_indicators.remote_count,
        type: average, label: Remote Count(Avg), expression: !!null '', value_format: !!null '',
        value_format_name: !!null '', _kind_hint: measure, _type_hint: number}]
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
    size_by_field: ueba_endpoint_indicators.score
    hide_legend: true
    series_types: {}
    series_colors:
      ueba_endpoint_indicators.remote_count: "#E57947"
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
    hidden_fields: []
    note_state: expanded
    note_display: above
    note_text: Bubble Size Based on Score
    listen:
      date: ueba_endpoint_indicators.event_date
    row: 9
    col: 0
    width: 24
    height: 10
  filters:
  - name: date
    title: date
    type: date_filter
    default_value: 15 days
    allow_multiple_values: true
    required: false
