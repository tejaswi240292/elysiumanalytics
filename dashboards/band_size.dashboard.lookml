- dashboard: bandwidth_usage_by__size
  title: Bandwidth Usage By  Size
  layout: newspaper
  elements:
  - title: Total Count
    name: Total Count
    model: ueba
    explore: ueba_bandwidth_usage_bysize
    type: single_value
    fields: [ueba_bandwidth_usage_bysize.Count_of_id]
    filters:
      ueba_bandwidth_usage_bysize.type: user
    limit: 500
    dynamic_fields: [{measure: count_of_id, based_on: ueba_bandwidth_usage_bysize.id,
        expression: '', label: Count of ID, type: count_distinct, _kind_hint: measure,
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
    single_value_title: Count of Users
    defaults_version: 1
    listen:
      date: ueba_bandwidth_usage_bysize.datefilter
    row: 2
    col: 0
    width: 5
    height: 6
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
      <font color="#585b88" size="2"><b>X-axis(Sentbytes and Name)</b>-Average of  Sent Bytes </font><br>
      <font color="#585b88" size="2"><b>Y-axis(Rcvdbytes)</b>-Average of Received Bytes</font>
      </html>
      </body>
    row: 2
    col: 5
    width: 9
    height: 6
  - title: Outliers
    name: Outliers
    model: ueba
    explore: ueba_bandwidth_usage_bysize
    type: looker_donut_multiples
    fields: [ueba_bandwidth_usage_bysize.level, ueba_bandwidth_usage_bysize.count]
    pivots: [ueba_bandwidth_usage_bysize.level]
    filters:
      ueba_bandwidth_usage_bysize.type: user
    sorts: [ueba_bandwidth_usage_bysize.level]
    limit: 500
    show_value_labels: false
    font_size: 12
    series_colors:
      0 - ueba_bandwidth_usage_bysize.count: "#75E2E2"
      1 - ueba_bandwidth_usage_bysize.count: "#FFD95F"
      2 - ueba_bandwidth_usage_bysize.count: "#E57947"
      3 - ueba_bandwidth_usage_bysize.count: "#B32F37"
    series_types: {}
    defaults_version: 1
    listen:
      date: ueba_bandwidth_usage_bysize.datefilter
    row: 2
    col: 14
    width: 10
    height: 6
  - title: Details Bandwidth usage by size
    name: Details Bandwidth usage by size
    model: ueba
    explore: ueba_bandwidth_usage_bysize
    type: looker_scatter
    fields: [ueba_bandwidth_usage_bysize.rcvdbytes, ueba_bandwidth_usage_bysize.sentbytes_and_name,
      ueba_bandwidth_usage_bysize.score, ueba_bandwidth_usage_bysize.event_date, ueba_bandwidth_usage_bysize.id]
    filters:
      ueba_bandwidth_usage_bysize.type: user
      ueba_bandwidth_usage_bysize.id: ''
      ueba_bandwidth_usage_bysize.sentbytes: ">0"
      ueba_bandwidth_usage_bysize.rcvdbytes: ">0"
    sorts: [ueba_bandwidth_usage_bysize.event_date desc]
    limit: 500
    dynamic_fields: [{measure: rcvdbytesavg, based_on: ueba_bandwidth_usage_bysize.rcvdbytes,
        type: average, label: Rcvdbytes(Avg), expression: !!null '', value_format: !!null '',
        value_format_name: !!null '', _kind_hint: measure, _type_hint: number}, {
        measure: sentbytesavg, based_on: ueba_bandwidth_usage_bysize.sentbytes, type: average,
        label: Sentbytes(Avg), expression: !!null '', value_format: !!null '', value_format_name: !!null '',
        _kind_hint: measure, _type_hint: number}, {measure: scoreavg, based_on: ueba_bandwidth_usage_bysize.score,
        type: average, label: Score(Avg), expression: !!null '', value_format: !!null '',
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
    y_axes: [{label: '', orientation: left, series: [{axisId: ueba_bandwidth_usage_bysize.rcvdbytes,
            id: ueba_bandwidth_usage_bysize.rcvdbytes, name: Rcvdbytes}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    size_by_field: ueba_bandwidth_usage_bysize.score
    hide_legend: true
    series_types: {}
    series_colors:
      ueba_bandwidth_usage_bysize.rcvdbytes: "#E57947"
    defaults_version: 1
    hidden_fields: []
    note_state: expanded
    note_display: above
    note_text: Bubble Size Is Based on Score
    listen:
      date: ueba_bandwidth_usage_bysize.datefilter
    row: 10
    col: 0
    width: 24
    height: 6
  filters:
  - name: date
    title: date
    type: date_filter
    default_value: 15 days
    allow_multiple_values: true
    required: false
