- dashboard: _privileged__account__usage
  title: " Privileged - Account - Usage"
  layout: newspaper
  elements:
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
      <font color="#585b88" size="2"><b>Y-axis(Total)</b>-Average of Privileged Count</font>
      </html>
      </body>
    row: 2
    col: 6
    width: 9
    height: 5
  - title: Untitled
    name: Untitled
    model: ueba
    explore: ueba_privileged_accountusage
    type: single_value
    fields: [ueba_privileged_accountusage.Count_of_id]
    filters:
      ueba_privileged_accountusage.type: user
    limit: 500
    dynamic_fields: [{measure: count_of_id, based_on: ueba_privileged_accountusage.id,
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
    defaults_version: 1
    hidden_fields: []
    y_axes: []
    listen:
      date: ueba_privileged_accountusage.event_date
    row: 2
    col: 0
    width: 6
    height: 5
  - title: Outliers
    name: Outliers
    model: ueba
    explore: ueba_privileged_accountusage
    type: looker_donut_multiples
    fields: [ueba_privileged_accountusage.level, ueba_privileged_accountusage.count]
    pivots: [ueba_privileged_accountusage.level]
    filters:
      ueba_privileged_accountusage.type: user
    sorts: [ueba_privileged_accountusage.level]
    limit: 500
    dynamic_fields: [{measure: average_of_score, based_on: ueba_privileged_accountusage.score,
        type: average, label: Average of Score, expression: !!null '', _kind_hint: measure,
        _type_hint: number}]
    show_value_labels: false
    font_size: 12
    series_colors:
      3 - ueba_privileged_accountusage.count: "#B32F37"
      0 - ueba_privileged_accountusage.count: "#75E2E2"
      1 - ueba_privileged_accountusage.count: "#FFD95F"
      2 - ueba_privileged_accountusage.count: "#E57947"
    series_types: {}
    defaults_version: 1
    hidden_fields: []
    y_axes: []
    listen:
      date: ueba_privileged_accountusage.datefilter
    row: 2
    col: 15
    width: 9
    height: 5
  - title: Details Privileged Account Usage
    name: Details Privileged Account Usage
    model: ueba
    explore: ueba_privileged_accountusage
    type: looker_scatter
    fields: [ueba_privileged_accountusage.total, ueba_privileged_accountusage.bandwidth_and_name,
      ueba_privileged_accountusage.score, ueba_privileged_accountusage.id]
    filters:
      ueba_privileged_accountusage.type: user
      ueba_privileged_accountusage.bandwidth: ">0"
      ueba_privileged_accountusage.total: ">0"
    sorts: [ueba_privileged_accountusage.score desc]
    limit: 500
    dynamic_fields: [{measure: totalavg, based_on: ueba_privileged_accountusage.total,
        type: average, label: Total(Avg), expression: !!null '', value_format: !!null '',
        value_format_name: !!null '', _kind_hint: measure, _type_hint: number}, {
        measure: scoreavg, based_on: ueba_privileged_accountusage.score, type: average,
        label: Score(Avg), expression: !!null '', value_format: !!null '', value_format_name: !!null '',
        _kind_hint: measure, _type_hint: number}, {measure: bandwidthavg, based_on: ueba_privileged_accountusage.bandwidth,
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
    y_axes: [{label: '', orientation: left, series: [{axisId: ueba_privileged_accountusage.total,
            id: ueba_privileged_accountusage.total, name: Total}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    size_by_field: ueba_privileged_accountusage.score
    hide_legend: true
    series_types: {}
    series_colors:
      ueba_privileged_accountusage.total: "#E57947"
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
    note_text: Bubble Size Is Based on Score
    listen:
      date: ueba_privileged_accountusage.event_date
    row: 9
    col: 0
    width: 24
    height: 9
  - title: Details View
    name: Details View
    model: itd
    explore: itd_360view
    type: table
    fields: [itd_360view.event_time_date, itd_360view.userid, itd_360view.sourceip,
      itd_360view.src_geo_city, itd_360view.count, itd_360view.hostname]
    filters: {}
    sorts: [itd_360view.userid desc, itd_360view.event_time_date desc, itd_360view.hostname]
    limit: 500
    total: true
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    transpose: false
    truncate_text: true
    size_to_fit: true
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    series_labels:
      itd_360view.count: Volume
    series_cell_visualizations:
      itd_360view.count:
        is_active: false
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
    hidden_fields: []
    y_axes: []
    listen:
      date: itd_360view.event_time_date
      User: itd_360view.userid
    row: 20
    col: 0
    width: 12
    height: 9
  - title: IP GEO MAP
    name: IP GEO MAP
    model: itd
    explore: itd_360view
    type: looker_map
    fields: [itd_360view.src_location, itd_360view.count]
    filters: {}
    sorts: [itd_360view.count desc]
    limit: 500
    map_plot_mode: points
    heatmap_gridlines: false
    heatmap_gridlines_empty: false
    heatmap_opacity: 0.5
    show_region_field: true
    draw_map_labels_above_data: true
    map_tile_provider: light
    map_position: fit_data
    map_scale_indicator: 'off'
    map_pannable: true
    map_zoomable: true
    map_marker_type: circle
    map_marker_icon_name: default
    map_marker_radius_mode: proportional_value
    map_marker_units: meters
    map_marker_proportional_scale_type: linear
    map_marker_color_mode: fixed
    show_view_names: false
    show_legend: true
    quantize_map_value_colors: false
    reverse_map_value_colors: false
    series_types: {}
    defaults_version: 1
    map: auto
    map_projection: ''
    quantize_colors: false
    hidden_fields: []
    y_axes: []
    listen:
      date: itd_360view.event_time_date
      User: itd_360view.userid
    row: 20
    col: 12
    width: 12
    height: 9
  filters:
  - name: date
    title: date
    type: date_filter
    default_value: 7 days
    allow_multiple_values: true
    required: false
  - name: User
    title: User
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    model: itd
    explore: itd_360view
    listens_to_filters: []
    field: itd_360view.userid
