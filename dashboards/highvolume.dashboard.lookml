- dashboard: high_volume_file_access
  title: High Volume file Access
  layout: newspaper
  elements:
  - title: Untitled
    name: Untitled
    model: ueba
    explore: ueba_highvolume_file_access
    type: single_value
    fields: [ueba_highvolume_file_access.Count_of_id]
    filters:
      ueba_highvolume_file_access.type: user
    limit: 500
    dynamic_fields: [{measure: count_of_id, based_on: ueba_highvolume_file_access.id,
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
    single_value_title: Count of users
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
      date: ueba_highvolume_file_access.datefilter
    row: 2
    col: 0
    width: 5
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
      <font color="#585b88" size="2"><b>X-axis(Bandwidth and Name)</b>-Average of Bandwidth </font><br>
      <font color="#585b88" size="2"><b>Y-axis(Total)</b>-Average of File Volume Count</font>
      </html>
      </body>
    row: 2
    col: 5
    width: 8
    height: 5
  - title: Outliers
    name: Outliers
    model: ueba
    explore: ueba_highvolume_file_access
    type: looker_donut_multiples
    fields: [ueba_highvolume_file_access.level, ueba_highvolume_file_access.count]
    pivots: [ueba_highvolume_file_access.level]
    filters:
      ueba_highvolume_file_access.type: user
    sorts: [ueba_highvolume_file_access.level]
    limit: 500
    show_value_labels: false
    font_size: 12
    series_colors:
      0 - ueba_highvolume_file_access.count: "#75E2E2"
      1 - ueba_highvolume_file_access.count: "#FFD95F"
      2 - ueba_highvolume_file_access.count: "#E57947"
      3 - ueba_highvolume_file_access.count: "#B32F37"
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
      date: ueba_highvolume_file_access.datefilter
    row: 2
    col: 13
    width: 11
    height: 5
  - title: Details
    name: Details
    model: ueba
    explore: ueba_highvolume_file_access
    type: looker_scatter
    fields: [ueba_highvolume_file_access.total, ueba_highvolume_file_access.bandwidth_and_name,
      ueba_highvolume_file_access.score, ueba_highvolume_file_access.event_date, ueba_highvolume_file_access.id]
    filters:
      ueba_highvolume_file_access.type: user
      ueba_highvolume_file_access.total: ">0"
      ueba_highvolume_file_access.bandwidth: ">0"
    sorts: [ueba_highvolume_file_access.event_date desc]
    limit: 500
    dynamic_fields: [{measure: totalavg, based_on: ueba_highvolume_file_access.total,
        type: average, label: Total(Avg), expression: !!null '', value_format: !!null '',
        value_format_name: !!null '', _kind_hint: measure, _type_hint: number}, {
        measure: scoreavg, based_on: ueba_highvolume_file_access.score, type: average,
        label: Score(Avg), expression: !!null '', value_format: !!null '', value_format_name: !!null '',
        _kind_hint: measure, _type_hint: number}, {measure: bandwidthavg, based_on: ueba_highvolume_file_access.bandwidth,
        type: average, label: Bandwidth(Avg), expression: !!null '', value_format: !!null '',
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
    size_by_field: ueba_highvolume_file_access.score
    hide_legend: true
    series_types: {}
    series_colors:
      ueba_highvolume_file_access.total: "#E57947"
    defaults_version: 1
    hidden_fields: []
    note_state: expanded
    note_display: above
    note_text: Bubble Size Based on Score
    listen:
      date: ueba_highvolume_file_access.datefilter
    row: 9
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
