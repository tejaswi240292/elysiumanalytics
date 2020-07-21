- dashboard: file_downloads
  title: File Downloads
  layout: newspaper
  elements:
  - title: Count
    name: Count
    model: ueba
    explore: ueba_file_download
    type: single_value
    fields: [ueba_file_download.Count_of_id]
    filters:
      ueba_file_download.type: entity
    limit: 500
    dynamic_fields: [{measure: count_of_id, based_on: ueba_file_download.id, expression: '',
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
    single_value_title: Count of Source Ip's
    series_types: {}
    defaults_version: 1
    listen:
      date: ueba_file_download.datefilter
    row: 2
    col: 0
    width: 7
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
      <font color="#585b88" size="2"><b>X-axis(Dst Count and Name)</b>-Average of Destination Count </font><br>
      <font color="#585b88" size="2"><b>Y-axis(Download Count)</b>-Average of Download Count</font>
      </html>
      </body>
    row: 2
    col: 7
    width: 8
    height: 6
  - title: Outliers
    name: Outliers
    model: ueba
    explore: ueba_file_download
    type: looker_donut_multiples
    fields: [ueba_file_download.level, ueba_file_download.count]
    pivots: [ueba_file_download.level]
    filters:
      ueba_file_download.type: entity
      ueba_file_download.score: "[50, 100]"
    sorts: [ueba_file_download.level]
    limit: 500
    show_value_labels: false
    font_size: 12
    series_colors:
      1 - ueba_file_download.count: "#FFD95F"
      2 - ueba_file_download.count: "#E57947"
      3 - ueba_file_download.count: "#B32F37"
      0 - ueba_file_download.count: "#75E2E2"
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
      date: ueba_file_download.datefilter
    row: 2
    col: 15
    width: 9
    height: 6
  - title: File Downloads
    name: File Downloads
    model: ueba
    explore: ueba_file_download
    type: looker_scatter
    fields: [ueba_file_download.download_count, ueba_file_download.dst_count_and_name,
      ueba_file_download.score, ueba_file_download.event_date, ueba_file_download.id]
    filters:
      ueba_file_download.download_count: ">0"
      ueba_file_download.dst_count: ">0"
    sorts: [ueba_file_download.event_date desc]
    limit: 500
    dynamic_fields: [{measure: download_countavg, based_on: ueba_file_download.download_count,
        type: average, label: Download Count(Avg), expression: !!null '', value_format: !!null '',
        value_format_name: !!null '', _kind_hint: measure, _type_hint: number}, {
        measure: dst_countavg, based_on: ueba_file_download.dst_count, type: average,
        label: Dst Count(Avg), expression: !!null '', value_format: !!null '', value_format_name: !!null '',
        _kind_hint: measure, _type_hint: number}, {measure: scoreavg, based_on: ueba_file_download.score,
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
    size_by_field: ueba_file_download.score
    hide_legend: true
    series_types: {}
    series_colors:
      ueba_file_download.download_count: "#E57947"
    defaults_version: 1
    note_state: expanded
    note_display: above
    note_text: Bubble Size Based On Score
    listen:
      date: ueba_file_download.datefilter
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
