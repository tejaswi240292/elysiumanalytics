- dashboard: soc_dashboard
  title: SOC Dashboard
  layout: newspaper
  elements:
  - title: Top 10 Bandwidth Usage
    name: Top 10 Bandwidth Usage
    model: odm
    explore: wgtraffic_odm
    type: looker_scatter
    fields: [wgtraffic_odm.src_user_name, wgtraffic_odm.Sum_of_in_bytes, wgtraffic_odm.Sum_of_Out_bytes]
    filters:
      wgtraffic_odm.src_user_name: "-NULL"
      wgtraffic_odm.event_time_date: 7 days
    limit: 10
    dynamic_fields: [{table_calculation: bandwidth, label: Bandwidth, expression: "${sum_of_in_bytes}\
          \ + ${sum_of_out_bytes}", value_format: !!null '', value_format_name: !!null '',
        is_disabled: true, _kind_hint: measure, _type_hint: number}, {measure: sum_of_in_bytes,
        based_on: wgtraffic_odm.in_bytes, type: sum, label: Sum of In Bytes, expression: !!null '',
        _kind_hint: measure, _type_hint: number}, {measure: sum_of_out_bytes, based_on: wgtraffic_odm.out_bytes,
        type: sum, label: Sum of Out Bytes, expression: !!null '', _kind_hint: measure,
        _type_hint: number}, {dimension: total, label: total, expression: '1', value_format: !!null '',
        value_format_name: !!null '', _kind_hint: dimension, _type_hint: number},
      {measure: calculation_5, based_on: total, type: count_distinct, label: Calculation
          5, expression: !!null '', value_format: !!null '', value_format_name: !!null '',
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
    point_style: circle
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    y_axes: [{label: '', orientation: left, series: [{axisId: sum_of_in_bytes, id: sum_of_in_bytes,
            name: In_Bytes}, {axisId: sum_of_out_bytes, id: sum_of_out_bytes, name: Out_bytes},
          {axisId: bandwidth, id: bandwidth, name: Bandwidth}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    size_by_field: ''
    hidden_series: []
    series_types: {}
    series_labels:
      sum_of_out_bytes: Out_bytes
      sum_of_in_bytes: In_Bytes
      wgtraffic_odm.src_user_name: User
    series_point_styles:
      sum_of_out_bytes: square
      sum_of_in_bytes: triangle
    trend_lines: []
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    hidden_fields: []
    hidden_points_if_no: []
    interpolation: linear
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    series_column_widths:
      wgtraffic_odm.src_user_name: 148
      sum_of_in_bytes: 193
      sum_of_out_bytes: 145
      bandwidth: 144
    series_cell_visualizations:
      sum_of_in_bytes:
        is_active: true
    series_text_format:
      wgtraffic_odm.src_user_name:
        align: center
      sum_of_out_bytes:
        align: center
      bandwidth:
        align: center
    defaults_version: 1
    value_labels: legend
    label_type: labPer
    listen: {}
    row: 7
    col: 16
    width: 8
    height: 7
  - title: ''
    name: ''
    model: alerts
    explore: alerts_view
    type: single_value
    fields: [alerts_view.count]
    filters:
      alerts_view.datefilter: 2 days
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#B32F37"
    single_value_title: Alerts Count
    conditional_formatting: [{type: equal to, value: !!null '', background_color: "#3EB0D5",
        font_color: "#B32F37", color_application: {collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7,
          palette_id: 85de97da-2ded-4dec-9dbd-e6a7d36d5825}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    series_types: {}
    defaults_version: 1
    listen: {}
    row: 0
    col: 18
    width: 6
    height: 3
  - title: ''
    name: " (2)"
    model: itd
    explore: dataview
    type: single_value
    fields: [dataview.Sum_of_ingested_count]
    filters:
      dataview.datefilter: 2 days
    limit: 500
    dynamic_fields: [{measure: sum_of_ingested_count, based_on: dataview.ingested_count,
        expression: '', label: Sum of Ingested Count, type: sum, _kind_hint: measure,
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
    single_value_title: Events Count
    series_types: {}
    defaults_version: 1
    listen: {}
    row: 3
    col: 18
    width: 6
    height: 4
  - title: Data Source loading over the last 7 days
    name: Data Source loading over the last 7 days
    model: itd
    explore: dataview
    type: looker_column
    fields: [dataview.source_type, dataview.date_time_date, dataview.Sum_of_ingested_count]
    pivots: [dataview.source_type]
    fill_fields: [dataview.date_time_date]
    filters:
      dataview.datefilter: 7 days
    sorts: [dataview.date_time_date desc, dataview.source_type]
    limit: 500
    dynamic_fields: [{measure: sum_of_ingested_count, based_on: dataview.ingested_count,
        expression: '', label: Sum of Ingested Count, type: sum, _kind_hint: measure,
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
    hide_legend: false
    series_types: {}
    show_null_points: true
    interpolation: linear
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    transpose: false
    truncate_text: true
    size_to_fit: true
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    listen: {}
    row: 7
    col: 0
    width: 16
    height: 7
  - title: UEBA's Sparkline
    name: UEBA's Sparkline
    model: ueba
    explore: ueba_outliers_ueba
    type: SPARKLINE_CC
    fields: [ueba_outliers_ueba.report_name, list_of_event_date_list, list_of_score_list,
      max_of_score_2]
    filters:
      ueba_outliers_ueba.event_date: 7 days
    sorts: [list_of_event_date_list desc]
    limit: 500
    dynamic_fields: [{measure: list_of_event_date_list, based_on: ueba_outliers_ueba.event_date_list,
        expression: '', label: List of Event Date List, type: list, _kind_hint: measure,
        _type_hint: list}, {measure: list_of_score_list, based_on: ueba_outliers_ueba.score_list,
        expression: '', label: List of Score List, type: list, _kind_hint: measure,
        _type_hint: list}, {measure: max_of_score, based_on: ueba_outliers_ueba.score,
        expression: '', label: Max of Score, type: max, _kind_hint: measure, _type_hint: number},
      {measure: max_of_score_2, based_on: ueba_outliers_ueba.score, expression: '',
        label: Max of Score, type: max, _kind_hint: measure, _type_hint: number}]
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
    listen: {}
    row: 14
    col: 13
    width: 11
    height: 6
  - title: Top 10 Risky Entities
    name: Top 10 Risky Entities
    model: itd
    explore: itd_high_risk_score
    type: looker_pie
    fields: [itd_high_risk_score.name, itd_high_risk_score.max_of_risk_score]
    filters:
      itd_high_risk_score.type: entity
      itd_high_risk_score.risk_score: ">=50"
      itd_high_risk_score.event_date: 15 days
    limit: 10
    column_limit: 50
    dynamic_fields: [{measure: max_of_risk_score, based_on: itd_high_risk_score.risk_score,
        expression: '', label: Max of Risk Score, type: max, _kind_hint: measure,
        _type_hint: number}, {measure: list_of_event_date_list, based_on: itd_high_risk_score.event_date_list,
        expression: '', label: List of Event Date List, type: list, _kind_hint: measure,
        _type_hint: list}, {measure: list_of_risk_score_list, based_on: itd_high_risk_score.risk_score_list,
        expression: '', label: List of Risk Score List, type: list, _kind_hint: measure,
        _type_hint: list}]
    query_timezone: America/Los_Angeles
    value_labels: labels
    label_type: labVal
    series_labels: {}
    hidden_fields: []
    hidden_points_if_no: []
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: gray
    limit_displayed_rows: false
    enable_conditional_formatting: true
    header_text_alignment: left
    header_font_size: '14'
    rows_font_size: '13'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: true
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    series_text_format:
      itd_high_risk_score.name:
        fg_color: "#fafff5"
        bg_color: "#878787"
      max_of_risk_score:
        fg_color: "#fbffeb"
        bg_color: "#171717"
    header_font_color: "#121211"
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#3EB0D5",
        font_color: !!null '', color_application: {collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7,
          palette_id: afd46b40-e939-4ace-bffd-69d1bb16ee05, options: {steps: 5}},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
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
    listen: {}
    row: 14
    col: 0
    width: 6
    height: 6
  - title: Top 10 Risky Users
    name: Top 10 Risky Users
    model: itd
    explore: itd_high_risk_score
    type: looker_pie
    fields: [itd_high_risk_score.name, itd_high_risk_score.max_of_risk_score]
    filters:
      itd_high_risk_score.type: user
      itd_high_risk_score.risk_score: ">=50"
      itd_high_risk_score.event_date: 15 days
    limit: 10
    column_limit: 50
    dynamic_fields: [{measure: max_of_risk_score, based_on: itd_high_risk_score.risk_score,
        expression: '', label: Max of Risk Score, type: max, _kind_hint: measure,
        _type_hint: number}, {measure: max_of_risk_score_2, based_on: itd_high_risk_score.risk_score,
        expression: '', label: Max of Risk Score, type: max, _kind_hint: measure,
        _type_hint: number}, {measure: list_of_event_date_list, based_on: itd_high_risk_score.event_date_list,
        expression: '', label: List of Event Date List, type: list, _kind_hint: measure,
        _type_hint: list}, {measure: list_of_risk_score_list, based_on: itd_high_risk_score.risk_score_list,
        expression: '', label: List of Risk Score List, type: list, _kind_hint: measure,
        _type_hint: list}]
    query_timezone: America/Los_Angeles
    value_labels: labels
    label_type: labVal
    series_labels: {}
    hidden_fields: []
    hidden_points_if_no: []
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: true
    header_text_alignment: left
    header_font_size: '14'
    rows_font_size: '13'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: true
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    series_cell_visualizations:
      max_of_risk_score_2:
        is_active: false
    series_text_format:
      itd_high_risk_score.name:
        fg_color: "#fffef4"
        bg_color: "#7a7377"
      max_of_risk_score_2:
        fg_color: "#ffffff"
        bg_color: "#1d1f1b"
    header_font_color: "#30332f"
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#3EB0D5",
        font_color: !!null '', color_application: {collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7,
          palette_id: afd46b40-e939-4ace-bffd-69d1bb16ee05, options: {steps: 5}},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    series_types: {}
    defaults_version: 1
    listen: {}
    row: 14
    col: 6
    width: 7
    height: 6
  - title: Top 10 Alerts
    name: Top 10 Alerts
    model: alerts
    explore: alerts_view
    type: looker_bar
    fields: [alerts_view.count, alerts_view.alert_abbr_nm]
    filters:
      alerts_view.datefilter: 2 days
    sorts: [alerts_view.count desc]
    limit: 10
    dynamic_fields: [{table_calculation: count_of_alert_type, label: count of alert_type,
        expression: 'count(${alerts_view.alert_type})', value_format: !!null '', value_format_name: !!null '',
        is_disabled: true, _kind_hint: dimension, _type_hint: number}, {measure: calculation_2,
        based_on: alerts_view.alert_type, type: count_distinct, label: Calculation
          2, expression: !!null '', value_format: !!null '', value_format_name: !!null '',
        _kind_hint: measure, _type_hint: number}]
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
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
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    x_axis_label: Type of Alert
    series_types: {}
    series_colors:
      alerts_view.count: "#B32F37"
    series_labels:
      alerts_view.src_username: User Name
      alerts_view.alert_type: Alert Type
      alerts_view.alert_desc: Alert Desc
      alerts_view.alert_abbr_nm: Alert Abbr
      alerts_view.count: Total Alerts Count
    label_color: [blue]
    reference_lines: []
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    series_column_widths:
      alerts_view.src_username: 134
      alerts_view.alert_type: 113
      alerts_view.alert_desc: 385
      alerts_view.alert_abbr_nm: 240
      alerts_view.count: 173
    series_cell_visualizations:
      alerts_view.count:
        is_active: false
    series_text_format:
      alerts_view.count:
        align: left
      alerts_view.alert_abbr_nm:
        align: left
      alerts_view.alert_desc:
        align: left
      alerts_view.alert_type:
        align: left
      alerts_view.src_username:
        align: left
    defaults_version: 1
    listen: {}
    row: 0
    col: 0
    width: 7
    height: 7
  - title: Top Alerts last 48 hours
    name: Top Alerts last 48 hours
    model: alerts
    explore: alerts_view
    type: looker_grid
    fields: [alerts_view.src_username, alerts_view.alert_abbr_nm, alerts_view.count]
    filters:
      alerts_view.event_time_date: 2 days
    sorts: [alerts_view.count desc]
    limit: 10
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: transparent
    limit_displayed_rows: false
    enable_conditional_formatting: true
    header_text_alignment: center
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    series_labels:
      alerts_view.src_username: User Name
      alerts_view.alert_type: Alert Type
      alerts_view.alert_abbr_nm: Alert Abbr
      alerts_view.count: Alert Count
    series_column_widths: {}
    series_cell_visualizations:
      alerts_view.count:
        is_active: false
    series_text_format:
      alerts_view.count:
        align: center
      alerts_view.alert_abbr_nm:
        align: center
        fg_color: "#000"
        bg_color: "#f8fcff"
      alerts_view.alert_type:
        align: center
      alerts_view.src_username:
        align: center
        bg_color: "#f8fcff"
        fg_color: "#000"
    header_font_color: "#B32F37"
    header_background_color: "#f8fcff"
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#3EB0D5",
        font_color: !!null '', color_application: {collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7,
          palette_id: 85de97da-2ded-4dec-9dbd-e6a7d36d5825, options: {steps: 5, reverse: true,
            stepped: true, mirror: false}}, bold: false, italic: false, strikethrough: false,
        fields: []}, {type: along a scale..., value: !!null '', background_color: "#3EB0D5",
        font_color: !!null '', color_application: {collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7,
          palette_id: 85de97da-2ded-4dec-9dbd-e6a7d36d5825}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    truncate_column_names: false
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
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    listen: {}
    row: 0
    col: 7
    width: 11
    height: 7
