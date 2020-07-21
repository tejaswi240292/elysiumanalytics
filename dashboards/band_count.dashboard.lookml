- dashboard: bandwidth_usage_by_count
  title: Bandwidth Usage By Count
  layout: newspaper
  elements:
  - name: INFORMATION
    type: text
    title_text: INFORMATION
    subtitle_text: ''
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
      <font color="#585b88" size="2"><b>X-axis(Isdownload and Name)</b>-Average of  Downloaded Bytes </font><br>
      <font color="#585b88" size="2"><b>Y-axis(Isupload)</b>-Average of  Uploaded  Bytes</font>
      </html>
      </body>
    row: 2
    col: 5
    width: 9
    height: 5
  - title: Count
    name: Count
    model: ueba
    explore: ueba_bandwidth_usage_bycount
    type: single_value
    fields: [ueba_bandwidth_usage_bycount.Count_of_id]
    filters:
      ueba_bandwidth_usage_bycount.type: user
    limit: 500
    dynamic_fields: [{measure: count_of_id, based_on: ueba_bandwidth_usage_bycount.id,
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
    color_application:
      collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
      palette_id: fb7bb53e-b77b-4ab6-8274-9d420d3d73f3
    single_value_title: count of users
    defaults_version: 1
    note_state: collapsed
    note_display: above
    note_text: ''
    listen:
      date: ueba_bandwidth_usage_bycount.datefilter
    row: 2
    col: 0
    width: 5
    height: 5
  - title: Outliers
    name: Outliers
    model: ueba
    explore: ueba_bandwidth_usage_bycount
    type: looker_donut_multiples
    fields: [ueba_bandwidth_usage_bycount.level, ueba_bandwidth_usage_bycount.count]
    pivots: [ueba_bandwidth_usage_bycount.level]
    filters:
      ueba_bandwidth_usage_bycount.type: user
      ueba_bandwidth_usage_bycount.User: ''
    sorts: [ueba_bandwidth_usage_bycount.level]
    limit: 500
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
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
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
      date: ueba_bandwidth_usage_bycount.datefilter
    row: 2
    col: 14
    width: 10
    height: 5
  - title: Details  Bandwidth Usage By Count
    name: Details  Bandwidth Usage By Count
    model: ueba
    explore: ueba_bandwidth_usage_bycount
    type: looker_scatter
    fields: [ueba_bandwidth_usage_bycount.isupload, ueba_bandwidth_usage_bycount.isdownload_and_name,
      ueba_bandwidth_usage_bycount.score, ueba_bandwidth_usage_bycount.event_date,
      ueba_bandwidth_usage_bycount.id]
    filters:
      ueba_bandwidth_usage_bycount.type: user
      ueba_bandwidth_usage_bycount.User: ''
    sorts: [ueba_bandwidth_usage_bycount.event_date desc]
    limit: 500
    dynamic_fields: [{measure: isdownloadavg, based_on: ueba_bandwidth_usage_bycount.isdownload,
        type: average, label: Isdownload(Avg), expression: !!null '', value_format: !!null '',
        value_format_name: !!null '', _kind_hint: measure, _type_hint: number}, {
        measure: isuploadavg, based_on: ueba_bandwidth_usage_bycount.isupload, type: average,
        label: Isupload(Avg), expression: !!null '', value_format: !!null '', value_format_name: !!null '',
        _kind_hint: measure, _type_hint: number}, {measure: scoreavg, based_on: ueba_bandwidth_usage_bycount.score,
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
    color_application:
      collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
      palette_id: fb7bb53e-b77b-4ab6-8274-9d420d3d73f3
      options:
        steps: 5
    size_by_field: ueba_bandwidth_usage_bycount.score
    series_types: {}
    series_colors:
      ueba_bandwidth_usage_bycount.isupload: "#E57947"
    hidden_fields: []
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
    listen:
      date: ueba_bandwidth_usage_bycount.event_date
    row: 9
    col: 0
    width: 24
    height: 7
  filters:
  - name: date
    title: date
    type: date_filter
    default_value: 15 days
    allow_multiple_values: true
    required: false
