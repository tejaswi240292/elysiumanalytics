- dashboard: unusual_domain
  title: UNUSUAL DOMAIN
  layout: newspaper
  elements:
  - title: Count
    name: Count
    model: ueba
    explore: ueba_unusualdomain
    type: single_value
    fields: [ueba_unusualdomain.Count_of_id]
    filters:
      ueba_unusualdomain.type: user
    limit: 500
    dynamic_fields: [{measure: count_of_id, based_on: ueba_unusualdomain.id, expression: '',
        label: Count of ID, type: count_distinct, _kind_hint: measure, _type_hint: number}]
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
      date: ueba_unusualdomain.datefilter
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
      <font color="#585b88" size="2"><b>X-axis(Upld Bytes and Name)</b>-Average of Uploaded Bytes </font><br>
      <font color="#585b88" size="2"><b>Y-axis(Distinct Domain Count)</b>-Average of Distinct Domain Count</font>
      </html>
      </body>
    row: 2
    col: 6
    width: 8
    height: 5
  - title: Outliers
    name: Outliers
    model: ueba
    explore: ueba_unusualdomain
    type: looker_donut_multiples
    fields: [ueba_unusualdomain.count, ueba_unusualdomain.level]
    pivots: [ueba_unusualdomain.level]
    filters:
      ueba_unusualdomain.type: user
    sorts: [ueba_unusualdomain.level]
    limit: 500
    show_value_labels: false
    font_size: 12
    series_colors:
      0 - ueba_unusualdomain.count: "#75E2E2"
      1 - ueba_unusualdomain.count: "#FFD95F"
      2 - ueba_unusualdomain.count: "#E57947"
      3 - ueba_unusualdomain.count: "#B32F37"
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    series_types: {}
    listen:
      date: ueba_unusualdomain.datefilter
    row: 2
    col: 14
    width: 10
    height: 5
  - title: Details Unusual Domain
    name: Details Unusual Domain
    model: ueba
    explore: ueba_unusualdomain
    type: looker_scatter
    fields: [ueba_unusualdomain.distinct_domain_count, ueba_unusualdomain.upld_bytes_and_name,
      ueba_unusualdomain.score, ueba_unusualdomain.event_date, ueba_unusualdomain.id]
    filters:
      ueba_unusualdomain.type: user
    sorts: [ueba_unusualdomain.event_date desc]
    limit: 500
    dynamic_fields: [{measure: upld_bytesavg, based_on: ueba_unusualdomain.upld_bytes,
        type: average, label: Upld Bytes(Avg), expression: !!null '', value_format: !!null '',
        value_format_name: !!null '', _kind_hint: measure, _type_hint: number}, {
        measure: distinct_domain_countavg, based_on: ueba_unusualdomain.distinct_domain_count,
        type: average, label: Distinct Domain Count(Avg), expression: !!null '', value_format: !!null '',
        value_format_name: !!null '', _kind_hint: measure, _type_hint: number}, {
        measure: scoreavg, based_on: ueba_unusualdomain.score, type: average, label: Score(Avg),
        expression: !!null '', value_format: !!null '', value_format_name: !!null '',
        _kind_hint: measure, _type_hint: number}]
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
    size_by_field: ueba_unusualdomain.score
    hide_legend: true
    series_types: {}
    series_colors:
      ueba_unusualdomain.distinct_domain_count: "#E57947"
    defaults_version: 1
    hidden_fields: []
    note_state: expanded
    note_display: above
    note_text: Bubble Size Based On Score
    listen:
      date: ueba_unusualdomain.datefilter
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
