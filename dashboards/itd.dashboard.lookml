- dashboard: insider_threat_detection
  title: INSIDER THREAT DETECTION
  layout: newspaper
  embed_style:
    background_color: "#f8fcff"
    show_title: true
    title_color: "#0d0cff"
    show_filters_bar: true
    tile_text_color: "#585b88"
    text_tile_text_color: ''
  elements:
  - title: Scores/Alerts
    name: Scores/Alerts
    model: itd
    explore: itd_high_risk_score
    type: looker_column
    fields: [itd_high_risk_score.event_date, itd_high_risk_score.max_of_total_alert_count,
      itd_high_risk_score.max_of_alert_score, itd_high_risk_score.max_of_anomoly_score,
      itd_high_risk_score.max_of_risk_score]
    fill_fields: [itd_high_risk_score.event_date]
    sorts: [itd_high_risk_score.event_date]
    limit: 500
    dynamic_fields: [{measure: max_of_max_alert_score, based_on: itd_high_risk_score.max_alert_score,
        type: sum, label: Max of Max Alert Score, expression: !!null '', value_format: !!null '',
        value_format_name: !!null '', _kind_hint: measure, _type_hint: number}, {
        measure: max_of_max_alert_score_2, based_on: itd_high_risk_score.max_alert_score,
        type: sum, label: Max of Max Alert Score, expression: !!null '', value_format: !!null '',
        value_format_name: !!null '', _kind_hint: measure, _type_hint: number}, {
        measure: max_of_risk_score, based_on: itd_high_risk_score.risk_score, type: sum,
        label: Max of Risk Score, expression: !!null '', value_format: !!null '',
        value_format_name: !!null '', _kind_hint: measure, _type_hint: number}, {
        measure: max_of_total_alert_count, based_on: itd_high_risk_score.total_alert_count,
        type: sum, label: Max of Total Alert Count, expression: !!null '', value_format: !!null '',
        value_format_name: !!null '', _kind_hint: measure, _type_hint: number}]
    x_axis_gridlines: false
    y_axis_gridlines: false
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
    color_application:
      collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
      palette_id: afd46b40-e939-4ace-bffd-69d1bb16ee05
      options:
        steps: 5
        reverse: true
    y_axes: [{label: '', orientation: left, series: [{axisId: itd_high_risk_score.max_of_total_alert_count,
            id: itd_high_risk_score.max_of_total_alert_count, name: Max of Total Alert
              Count}, {axisId: itd_high_risk_score.max_of_alert_score, id: itd_high_risk_score.max_of_alert_score,
            name: Max of Alert Score}, {axisId: itd_high_risk_score.max_of_anomoly_score,
            id: itd_high_risk_score.max_of_anomoly_score, name: Max of Anomoly Score},
          {axisId: itd_high_risk_score.max_of_risk_score, id: itd_high_risk_score.max_of_risk_score,
            name: Max of Risk Score}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: log}]
    hidden_series: [max_of_total_alert_count]
    series_types: {}
    series_colors: {}
    defaults_version: 1
    listen:
      Date: itd_high_risk_score.event_date
      user: itd_high_risk_score.name
    row: 13
    col: 17
    width: 7
    height: 9
  - title: Anomalous User/Entity by Source
    name: Anomalous User/Entity by Source
    model: itd
    explore: itd_anomoly_user_entity
    type: looker_column
    fields: [itd_anomoly_user_entity.event_date, itd_anomoly_user_entity.source, itd_anomoly_user_entity.distinct_adj]
    pivots: [itd_anomoly_user_entity.source]
    fill_fields: [itd_anomoly_user_entity.event_date]
    sorts: [itd_anomoly_user_entity.event_date desc, itd_anomoly_user_entity.source]
    limit: 500
    dynamic_fields: [{measure: count_of_adj_anomaly_score, based_on: itd_anomoly_user_entity.adj_anomaly_score,
        expression: '', label: Count of Adj Anomaly Score, type: count_distinct, _kind_hint: measure,
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
    color_application:
      collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
      palette_id: afd46b40-e939-4ace-bffd-69d1bb16ee05
      options:
        steps: 5
    y_axes: [{label: ANOMALOUS COUNT, orientation: left, series: [{axisId: count_of_adj_anomaly_score,
            id: msexchange_pas - count_of_adj_anomaly_score, name: msexchange_pas},
          {axisId: count_of_adj_anomaly_score, id: wgtraffic_pas - count_of_adj_anomaly_score,
            name: wgtraffic_pas}, {axisId: count_of_adj_anomaly_score, id: windowsnxlog_pas
              - count_of_adj_anomaly_score, name: windowsnxlog_pas}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    series_types: {}
    series_colors:
      msexchange_pas - itd_anomoly_user_entity.distinct_adj: "#ffc19f"
    series_labels:
      msexchange_pas - itd_anomoly_user_entity.distinct_adj: Msexchange
      wgtraffic_pas - itd_anomoly_user_entity.distinct_adj: Wgtraffic
      windowsnxlog_pas - itd_anomoly_user_entity.distinct_adj: Windowsnxlog
    defaults_version: 1
    listen:
      Date: itd_anomoly_user_entity.event_date
    row: 0
    col: 9
    width: 15
    height: 5
  - title: Threat Entities
    name: Threat Entities
    model: itd
    explore: itd_high_risk_score
    type: SPARKLINE_CC
    fields: [itd_high_risk_score.name, list_of_event_date_list, list_of_risk_score_list,
      max_of_risk_score]
    filters:
      itd_high_risk_score.type: entity
      itd_high_risk_score.risk_score: ">=70"
    sorts: [max_of_risk_score desc]
    limit: 500
    dynamic_fields: [{measure: max_of_risk_score, based_on: itd_high_risk_score.risk_score,
        expression: '', label: Max of Risk Score, type: max, _kind_hint: measure,
        _type_hint: number}, {measure: list_of_event_date_list, based_on: itd_high_risk_score.event_date_list,
        expression: '', label: List of Event Date List, type: list, _kind_hint: measure,
        _type_hint: list}, {measure: list_of_risk_score_list, based_on: itd_high_risk_score.risk_score_list,
        expression: '', label: List of Risk Score List, type: list, _kind_hint: measure,
        _type_hint: list}]
    query_timezone: America/Los_Angeles
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
    defaults_version: 0
    series_types: {}
    listen:
      Date: itd_high_risk_score.event_date
      user: itd_high_risk_score.name
    row: 13
    col: 0
    width: 8
    height: 9
  - title: Behaviors (Of Risky Users/Entities)
    name: Behaviors (Of Risky Users/Entities)
    model: itd
    explore: itd_high_risk_score
    type: looker_line
    fields: [itd_high_risk_score.event_date, itd_high_risk_score.name, itd_high_risk_score.max_risk_score]
    pivots: [itd_high_risk_score.name]
    fill_fields: [itd_high_risk_score.event_date]
    filters:
      itd_high_risk_score.risk_score: ">=70"
    sorts: [itd_high_risk_score.event_date desc, itd_high_risk_score.name]
    limit: 500
    dynamic_fields: [{measure: max_of_risk_score, based_on: itd_high_risk_score.risk_score,
        expression: '', label: Max of Risk Score, type: max, _kind_hint: measure,
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
    show_null_points: true
    interpolation: linear
    y_axes: [{label: '', orientation: left, series: [{axisId: itd_high_risk_score.max_risk_score,
            id: 192.168.0.102 - itd_high_risk_score.max_risk_score, name: 192.168.0.102},
          {axisId: itd_high_risk_score.max_risk_score, id: 192.168.110.200 - itd_high_risk_score.max_risk_score,
            name: 192.168.110.200}, {axisId: itd_high_risk_score.max_risk_score, id: 192.168.110.75
              - itd_high_risk_score.max_risk_score, name: 192.168.110.75}, {axisId: itd_high_risk_score.max_risk_score,
            id: ahmedi.zaitun - itd_high_risk_score.max_risk_score, name: ahmedi.zaitun},
          {axisId: itd_high_risk_score.max_risk_score, id: akhil.polamarasetty - itd_high_risk_score.max_risk_score,
            name: akhil.polamarasetty}, {axisId: itd_high_risk_score.max_risk_score,
            id: andrew.vincent - itd_high_risk_score.max_risk_score, name: andrew.vincent},
          {axisId: itd_high_risk_score.max_risk_score, id: ashok.edupuganti - itd_high_risk_score.max_risk_score,
            name: ashok.edupuganti}, {axisId: itd_high_risk_score.max_risk_score,
            id: benarji.v - itd_high_risk_score.max_risk_score, name: benarji.v},
          {axisId: itd_high_risk_score.max_risk_score, id: bryan.lauer - itd_high_risk_score.max_risk_score,
            name: bryan.lauer}, {axisId: itd_high_risk_score.max_risk_score, id: caitlin.callahan
              - itd_high_risk_score.max_risk_score, name: caitlin.callahan}, {axisId: itd_high_risk_score.max_risk_score,
            id: eric.leonard - itd_high_risk_score.max_risk_score, name: eric.leonard},
          {axisId: itd_high_risk_score.max_risk_score, id: kalyan.vutapalli - itd_high_risk_score.max_risk_score,
            name: kalyan.vutapalli}, {axisId: itd_high_risk_score.max_risk_score,
            id: manju.balakrishnan - itd_high_risk_score.max_risk_score, name: manju.balakrishnan},
          {axisId: itd_high_risk_score.max_risk_score, id: rakesh.dhungel - itd_high_risk_score.max_risk_score,
            name: rakesh.dhungel}, {axisId: itd_high_risk_score.max_risk_score, id: sandeep.pothireddy
              - itd_high_risk_score.max_risk_score, name: sandeep.pothireddy}, {axisId: itd_high_risk_score.max_risk_score,
            id: satish.chilkury - itd_high_risk_score.max_risk_score, name: satish.chilkury},
          {axisId: itd_high_risk_score.max_risk_score, id: sstechlaptop411$ - itd_high_risk_score.max_risk_score,
            name: sstechlaptop411$}, {axisId: itd_high_risk_score.max_risk_score,
            id: sstechlaptop419$ - itd_high_risk_score.max_risk_score, name: sstechlaptop419$},
          {axisId: itd_high_risk_score.max_risk_score, id: sstechlaptop450$ - itd_high_risk_score.max_risk_score,
            name: sstechlaptop450$}, {axisId: itd_high_risk_score.max_risk_score,
            id: sstechlaptop467$ - itd_high_risk_score.max_risk_score, name: sstechlaptop467$},
          {axisId: itd_high_risk_score.max_risk_score, id: sstechlaptop509$ - itd_high_risk_score.max_risk_score,
            name: sstechlaptop509$}, {axisId: itd_high_risk_score.max_risk_score,
            id: sstechlaptop520$ - itd_high_risk_score.max_risk_score, name: sstechlaptop520$},
          {axisId: itd_high_risk_score.max_risk_score, id: sstechlaptop96$ - itd_high_risk_score.max_risk_score,
            name: sstechlaptop96$}, {axisId: itd_high_risk_score.max_risk_score, id: trupti.t
              - itd_high_risk_score.max_risk_score, name: trupti.t}], showLabels: true,
        showValues: true, maxValue: 100, minValue: 0, unpinAxis: false, tickDensity: custom,
        tickDensityCustom: 5, type: linear}]
    hide_legend: false
    series_types: {}
    defaults_version: 1
    listen:
      Date: itd_high_risk_score.event_date
      user: itd_high_risk_score.name
    row: 5
    col: 0
    width: 24
    height: 8
  - title: User/Entity Count with High Risk Scores
    name: User/Entity Count with High Risk Scores
    model: itd
    explore: itd_high_risk_score
    type: looker_column
    fields: [itd_high_risk_score.event_date, itd_high_risk_score.count]
    fill_fields: [itd_high_risk_score.event_date]
    filters:
      itd_high_risk_score.risk_score: ">70"
    sorts: [itd_high_risk_score.event_date desc]
    limit: 500
    dynamic_fields: [{measure: count_of_risk_score, based_on: itd_high_risk_score.risk_score,
        expression: '', label: Count of Risk Score, type: count_distinct, _kind_hint: measure,
        _type_hint: number}]
    x_axis_gridlines: false
    y_axis_gridlines: false
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
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    color_application:
      collection_id: 1bc1f1d8-7461-4bfd-8c3b-424b924287b5
      palette_id: dd87bc4e-d86f-47b1-b0fd-44110dc0b469
      options:
        steps: 5
    y_axes: [{label: RISK SCORE, orientation: left, series: [{axisId: itd_high_risk_score.count,
            id: itd_high_risk_score.count, name: Itd High Risk Score}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    series_types: {}
    series_colors:
      itd_high_risk_score.count: "#72D16D"
    series_labels:
      itd_high_risk_score.count: High Risk Score
    defaults_version: 1
    listen:
      Date: itd_high_risk_score.event_date
      user: itd_high_risk_score.name
    row: 0
    col: 0
    width: 9
    height: 5
  - title: Threat Users
    name: Threat Users
    model: itd
    explore: itd_high_risk_score
    type: SPARKLINE_CC
    fields: [itd_high_risk_score.name, list_of_event_date_list, list_of_risk_score_list,
      max_of_risk_score_2]
    filters:
      itd_high_risk_score.type: user
      itd_high_risk_score.risk_score: ">70"
    sorts: [max_of_risk_score_2 desc]
    limit: 500
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
    defaults_version: 0
    listen:
      Date: itd_high_risk_score.event_date
      user: itd_high_risk_score.name
    row: 13
    col: 8
    width: 9
    height: 9
  filters:
  - name: Date
    title: Date
    type: date_filter
    default_value: 15 days
    allow_multiple_values: true
    required: false
  - name: user
    title: user
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    model: itd
    explore: itd_high_risk_score
    listens_to_filters: []
    field: itd_high_risk_score.name
