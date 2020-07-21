- dashboard: security_posture
  title: SECURITY POSTURE
  layout: newspaper
  elements:
  - title: NOTABLE THREATS
    name: NOTABLE THREATS
    model: itd
    explore: itd_high_risk_score
    type: single_value
    fields: [itd_high_risk_score.event_date, itd_high_risk_score.count]
    filters:
      itd_high_risk_score.risk_score: ">=50"
      itd_high_risk_score.count: NOT NULL
    sorts: [itd_high_risk_score.event_date desc]
    dynamic_fields: [{table_calculation: offset, label: offset, expression: "${itd_high_risk_score.count}\
          \ - offset(${itd_high_risk_score.count},1)", value_format: !!null '', value_format_name: !!null '',
        is_disabled: false, _kind_hint: measure, _type_hint: number}]
    query_timezone: America/Los_Angeles
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: true
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    comparison_label: Total Count
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
    defaults_version: 1
    series_types: {}
    listen:
      date: itd_high_risk_score.event_date
    row: 0
    col: 0
    width: 4
    height: 4
  - title: OUTLIERS UEBA
    name: OUTLIERS UEBA
    model: ueba
    explore: ueba_outliers_ueba
    type: single_value
    fields: [ueba_outliers_ueba.count, ueba_outliers_ueba.event_date]
    filters:
      ueba_outliers_ueba.count: NOT NULL
      ueba_outliers_ueba.score: ">=50"
    sorts: [ueba_outliers_ueba.event_date desc]
    limit: 500
    dynamic_fields: [{table_calculation: offset, label: offset, expression: "${ueba_outliers_ueba.count}\
          \ - offset(${ueba_outliers_ueba.count},1)", value_format: !!null '', value_format_name: !!null '',
        _kind_hint: measure, _type_hint: number}]
    query_timezone: America/Los_Angeles
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: true
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    comparison_label: Total Count
    series_types: {}
    defaults_version: 1
    listen:
      date: ueba_outliers_ueba.event_date
    row: 0
    col: 4
    width: 4
    height: 4
  - title: NOTABLE IDENTITY
    name: NOTABLE IDENTITY
    model: ml
    explore: msexchange_mlscore_batch
    type: single_value
    fields: [msexchange_mlscore_batch.event_date, msexchange_mlscore_batch.count]
    filters:
      msexchange_mlscore_batch.count: NOT NULL
      msexchange_mlscore_batch.pas: ">=50"
    sorts: [msexchange_mlscore_batch.event_date desc]
    limit: 500
    dynamic_fields: [{table_calculation: offset, label: offset, expression: "${msexchange_mlscore_batch.count}-offset(${msexchange_mlscore_batch.count},1)",
        value_format: !!null '', value_format_name: !!null '', _kind_hint: measure,
        _type_hint: number}]
    query_timezone: America/Los_Angeles
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: true
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    comparison_label: Total count
    series_types: {}
    defaults_version: 1
    listen:
      date: msexchange_mlscore_batch.event_date
    row: 0
    col: 8
    width: 4
    height: 4
  - title: NOTABLE ENDPOINTS
    name: NOTABLE ENDPOINTS
    model: itd
    explore: itd_high_risk_score
    type: single_value
    fields: [itd_high_risk_score.event_date, itd_high_risk_score.count]
    filters:
      itd_high_risk_score.count: NOT NULL
      itd_high_risk_score.max_anomaly_score: ">=50"
    sorts: [itd_high_risk_score.event_date desc]
    limit: 500
    dynamic_fields: [{table_calculation: calculation_1, label: Calculation 1, expression: "${itd_high_risk_score.count}\
          \ - offset(${itd_high_risk_score.count},1)", value_format: !!null '', value_format_name: !!null '',
        _kind_hint: measure, _type_hint: number}]
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: true
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    comparison_label: Total Count
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
    defaults_version: 1
    series_types: {}
    listen:
      date: itd_high_risk_score.event_date
    row: 0
    col: 12
    width: 4
    height: 4
  - title: NOTABLE NETWORKS
    name: NOTABLE NETWORKS
    model: ml
    explore: wgtraffic_ml_score_batch
    type: single_value
    fields: [wgtraffic_ml_score_batch.event_date, wgtraffic_ml_score_batch.count]
    filters:
      wgtraffic_ml_score_batch.count: NOT NULL
      wgtraffic_ml_score_batch.pas: ">50"
    sorts: [wgtraffic_ml_score_batch.event_date desc]
    limit: 500
    dynamic_fields: [{table_calculation: calculation_1, label: Calculation 1, expression: "${wgtraffic_ml_score_batch.count}\
          \ - offset(${wgtraffic_ml_score_batch.count},1)", value_format: !!null '',
        value_format_name: !!null '', _kind_hint: measure, _type_hint: number}]
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: true
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    comparison_label: Total Count
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
    defaults_version: 1
    series_types: {}
    listen:
      date: wgtraffic_ml_score_batch.event_date
    row: 0
    col: 16
    width: 4
    height: 4
  - title: NOTABLE ACCESS
    name: NOTABLE ACCESS
    model: ml
    explore: windowsnxlog_ml_score_batch
    type: single_value
    fields: [windowsnxlog_ml_score_batch.event_date, windowsnxlog_ml_score_batch.count]
    filters:
      windowsnxlog_ml_score_batch.pas: ">=50"
      windowsnxlog_ml_score_batch.count: NOT NULL
    sorts: [windowsnxlog_ml_score_batch.event_date desc]
    limit: 500
    dynamic_fields: [{table_calculation: calculation_1, label: Calculation 1, expression: "${windowsnxlog_ml_score_batch.count}\
          \ - offset(${windowsnxlog_ml_score_batch.count},1)", value_format: !!null '',
        value_format_name: !!null '', _kind_hint: measure, _type_hint: number}]
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: true
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    comparison_label: Total Count
    series_types: {}
    defaults_version: 1
    listen:
      date: windowsnxlog_ml_score_batch.event_date
    row: 0
    col: 20
    width: 4
    height: 4
  - title: TOP NOTABLE EVENTS
    name: TOP NOTABLE EVENTS
    model: ueba
    explore: ueba_outliers_ueba
    type: SPARKLINE_CC
    fields: [ueba_outliers_ueba.report_name, list_of_event_date_list, list_of_score_list,
      max_of_score]
    filters: {}
    sorts: [list_of_event_date_list desc]
    limit: 500
    dynamic_fields: [{measure: list_of_event_date_list, based_on: ueba_outliers_ueba.event_date_list,
        expression: '', label: List of Event Date List, type: list, _kind_hint: measure,
        _type_hint: list}, {measure: list_of_score_list, based_on: ueba_outliers_ueba.score_list,
        expression: '', label: List of Score List, type: list, _kind_hint: measure,
        _type_hint: list}, {measure: max_of_score, based_on: ueba_outliers_ueba.score,
        expression: '', label: Max of Score, type: max, _kind_hint: measure, _type_hint: number}]
    hidden_fields: []
    hidden_points_if_no: []
    series_labels: {}
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 0
    series_types: {}
    listen:
      date: ueba_outliers_ueba.event_date
    row: 10
    col: 0
    width: 24
    height: 7
  - title: NOTABLE EVENTS BY URGENCY
    name: NOTABLE EVENTS BY URGENCY
    model: itd
    explore: itd_high_risk_score
    type: looker_bar
    fields: [itd_high_risk_score.urgency, itd_high_risk_score.sum_of_risk_score]
    pivots: [itd_high_risk_score.urgency]
    filters: {}
    sorts: [itd_high_risk_score.urgency]
    limit: 500
    dynamic_fields: [{measure: sum_of_risk_score, based_on: itd_high_risk_score.risk_score,
        expression: '', label: Sum of Risk Score, type: sum, _kind_hint: measure,
        _type_hint: number}]
    query_timezone: America/Los_Angeles
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
    series_types: {}
    series_colors:
      critical - itd_high_risk_score.sum_of_risk_score: "#B32F37"
      low - itd_high_risk_score.sum_of_risk_score: "#C2DD67"
      medium - itd_high_risk_score.sum_of_risk_score: "#FBB555"
      unknown - itd_high_risk_score.sum_of_risk_score: "#FFD95F"
    series_labels:
      unknown - itd_high_risk_score.sum_of_risk_score: Average
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    listen:
      date: itd_high_risk_score.event_date
    row: 4
    col: 0
    width: 12
    height: 6
  - title: NETWORK EVENTS OVER TIME
    name: NETWORK EVENTS OVER TIME
    model: sp
    explore: sp_networkevents_overtime
    type: looker_line
    fields: [sp_networkevents_overtime.eventdate, sp_networkevents_overtime.type,
      sp_networkevents_overtime.sum_of_type_count]
    pivots: [sp_networkevents_overtime.type]
    fill_fields: [sp_networkevents_overtime.eventdate]
    filters: {}
    sorts: [sp_networkevents_overtime.eventdate desc, sp_networkevents_overtime.type]
    limit: 500
    dynamic_fields: [{measure: sum_of_type_count, based_on: sp_networkevents_overtime.type_count,
        expression: '', label: Sum of Type Count, type: sum, _kind_hint: measure,
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
    show_null_points: true
    interpolation: linear
    series_types: {}
    series_colors:
      outliers - sp_networkevents_overtime.sum_of_type_count: "#B32F37"
    defaults_version: 1
    listen:
      date: sp_networkevents_overtime.eventdate
    row: 4
    col: 12
    width: 12
    height: 6
  filters:
  - name: date
    title: date
    type: date_filter
    default_value: 30 days
    allow_multiple_values: true
    required: false
