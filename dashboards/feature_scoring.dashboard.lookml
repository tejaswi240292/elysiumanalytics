- dashboard: feature_scoringdetails
  title: Feature_Scoring(Details)
  layout: newspaper
  elements:
  - title: Risk Count/Time
    name: Risk Count/Time
    model: itd
    explore: itd_high_risk_score
    type: looker_line
    fields: [itd_high_risk_score.event_date, itd_high_risk_score.count]
    fill_fields: [itd_high_risk_score.event_date]
    filters:
      itd_high_risk_score.risk_score: "[70, 100]"
    sorts: [itd_high_risk_score.event_date desc]
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
    y_axes: [{label: '', orientation: left, series: [{axisId: itd_high_risk_score.count,
            id: itd_high_risk_score.count, name: Itd High Risk Score}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    series_types: {}
    series_labels:
      itd_high_risk_score.count: Volume
    defaults_version: 1
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    listen:
      date: itd_high_risk_score.event_date
    row: 0
    col: 0
    width: 24
    height: 5
  - title: Alert Score
    name: Alert Score
    model: itd
    explore: itd_high_risk_score
    type: table
    fields: [max_of_max_alert_score, itd_high_risk_score.max_alert_score, itd_high_risk_score.name]
    pivots: [itd_high_risk_score.name]
    filters:
      itd_high_risk_score.risk_score: "[50, 85.35]"
      itd_high_risk_score.name: -"[Null]",-::1
    sorts: [max_of_max_alert_score desc 0, itd_high_risk_score.max_alert_score, itd_high_risk_score.name]
    limit: 500
    dynamic_fields: [{measure: max_of_max_alert_score, based_on: itd_high_risk_score.max_alert_score,
        expression: '', label: Max of Max Alert Score, type: max, _kind_hint: measure,
        _type_hint: number}]
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    limit_displayed_rows: false
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_labels:
      max_of_max_alert_score: Max Alert Score (Max)
    conditional_formatting: [{type: equal to, value: 0, background_color: "#C2DD67",
        font_color: !!null '', color_application: {collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7,
          palette_id: 1e4d66b9-f066-4c33-b0b7-cc10b4810688, options: {constraints: {
              min: {type: minimum}, mid: {type: number, value: 0}, max: {type: maximum}},
            mirror: true, reverse: false, stepped: false}}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    series_types: {}
    defaults_version: 1
    listen:
      date: itd_high_risk_score.event_date
    row: 5
    col: 0
    width: 24
    height: 4
  - title: user_risk_score Details
    name: user_risk_score Details
    model: itd
    explore: itd_high_risk_score
    type: looker_grid
    fields: [itd_high_risk_score.event_date, itd_high_risk_score.name, average_of_max_anomaly_score,
      average_of_risk_score, itd_high_risk_score.total_alert_count]
    filters:
      itd_high_risk_score.name: -"[Null]",-::1
    sorts: [itd_high_risk_score.event_date desc]
    limit: 500
    total: true
    dynamic_fields: [{measure: average_of_max_anomaly_score, based_on: itd_high_risk_score.max_anomaly_score,
        expression: '', label: Average of Max Anomaly Score, type: average, _kind_hint: measure,
        _type_hint: number}, {measure: average_of_risk_score, based_on: itd_high_risk_score.risk_score,
        expression: '', label: Average of Risk Score, type: average, _kind_hint: measure,
        _type_hint: number}]
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
      average_of_max_anomaly_score: Max Anomaly Score(Avg)
      average_of_risk_score: Risk Score(Avg)
    series_cell_visualizations:
      average_of_max_anomaly_score:
        is_active: false
    series_types: {}
    defaults_version: 1
    listen:
      date: itd_high_risk_score.event_date
    row: 9
    col: 0
    width: 24
    height: 7
  - title: Scores/Alerts Counts
    name: Scores/Alerts Counts
    model: itd
    explore: itd_high_risk_score
    type: looker_column
    fields: [itd_high_risk_score.event_date, sum_of_max_anomaly_score, sum_of_risk_score,
      sum_of_total_alert_count]
    filters: {}
    sorts: [itd_high_risk_score.event_date desc]
    limit: 500
    dynamic_fields: [{measure: sum_of_max_anomaly_score, based_on: itd_high_risk_score.max_anomaly_score,
        expression: '', label: Sum of Max Anomaly Score, type: sum, _kind_hint: measure,
        _type_hint: number}, {measure: sum_of_risk_score, based_on: itd_high_risk_score.risk_score,
        expression: '', label: Sum of Risk Score, type: sum, _kind_hint: measure,
        _type_hint: number}, {measure: sum_of_total_alert_count, based_on: itd_high_risk_score.total_alert_count,
        expression: '', label: Sum of Total Alert Count, type: sum, _kind_hint: measure,
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
    hidden_series: []
    series_types: {}
    series_labels:
      sum_of_max_anomaly_score: Max Anomaly Score (Sum)
      sum_of_risk_score: Risk Score(Sum)
      sum_of_total_alert_count: Total Alert Count(Sum)
    defaults_version: 1
    listen:
      date: itd_high_risk_score.event_date
    row: 16
    col: 0
    width: 24
    height: 6
  filters:
  - name: date
    title: date
    type: date_filter
    default_value: 7 days
    allow_multiple_values: true
    required: false
