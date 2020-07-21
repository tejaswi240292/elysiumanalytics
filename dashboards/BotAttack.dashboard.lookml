- dashboard: _bot_attack
  title: " Bot Attack"
  layout: newspaper
  elements:
  - title: COUNT OF SOURCE IP'S
    name: COUNT OF SOURCE IP'S
    model: ueba
    explore: ueba_botattack
    type: single_value
    fields: [ueba_botattack.Count_of_id]
    filters:
      ueba_botattack.type: entity
    limit: 500
    dynamic_fields: [{measure: count_of_id, based_on: ueba_botattack.id, expression: '',
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
    custom_color: ''
    single_value_title: Count of Source Ip's
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
    defaults_version: 1
    series_types: {}
    listen:
      date: ueba_botattack.datefilter
    row: 0
    col: 0
    width: 6
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
      <font color="#585b88" size="2"><b>X-axis(Src Count and Name)</b>-Average of Source Count </font><br>
      <font color="#585b88" size="2"><b>Y-axis(Dst Count)</b>-Average of Destination Count</font>
      </html>
      </body>
    row: 0
    col: 6
    width: 7
    height: 6
  - title: Outliers
    name: Outliers
    model: ueba
    explore: ueba_botattack
    type: looker_donut_multiples
    fields: [ueba_botattack.level, ueba_botattack.count]
    pivots: [ueba_botattack.level]
    filters:
      ueba_botattack.type: entity
    sorts: [ueba_botattack.level]
    limit: 500
    show_value_labels: false
    font_size: 12
    hide_legend: false
    series_colors:
      0 - ueba_botattack.count: "#75E2E2"
    series_types: {}
    defaults_version: 1
    listen:
      date: ueba_botattack.datefilter
    row: 0
    col: 13
    width: 11
    height: 6
  - title: Details Bot Attack
    name: Details Bot Attack
    model: ueba
    explore: ueba_botattack
    type: looker_scatter
    fields: [ueba_botattack.dst_count, ueba_botattack.src_count_and_name, ueba_botattack.score,
      ueba_botattack.event_date, ueba_botattack.id]
    filters: {}
    sorts: [ueba_botattack.event_date desc]
    limit: 500
    dynamic_fields: [{measure: src_countavg, based_on: ueba_botattack.src_count, type: average,
        label: Src Count(Avg), expression: !!null '', value_format: !!null '', value_format_name: !!null '',
        _kind_hint: measure, _type_hint: number}, {measure: dst_countavg, based_on: ueba_botattack.dst_count,
        type: average, label: Dst Count(Avg), expression: !!null '', value_format: !!null '',
        value_format_name: !!null '', _kind_hint: measure, _type_hint: number}, {
        measure: scoreavg, based_on: ueba_botattack.score, type: average, label: Score(Avg),
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
    limit_displayed_rows: true
    legend_position: center
    point_style: circle_outline
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    y_axes: [{label: '', orientation: left, series: [{axisId: average_of_src_count,
            id: average_of_src_count, name: Average of Src Count}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    x_axis_label: ''
    size_by_field: ueba_botattack.score
    limit_displayed_rows_values:
      show_hide: hide
      first_last: first
      num_rows: 0
    hide_legend: true
    series_types: {}
    series_colors:
      ueba_botattack.dst_count: "#E57947"
    defaults_version: 1
    hidden_fields: []
    note_state: expanded
    note_display: above
    note_text: Bubble Size Based On Score
    listen:
      date: ueba_botattack.datefilter
    row: 6
    col: 0
    width: 24
    height: 8
  filters:
  - name: date
    title: date
    type: date_filter
    default_value: 15 days
    allow_multiple_values: true
    required: false
