- dashboard: feature_agg
  title: Feature_Agg
  layout: newspaper
  elements:
  - title: Standard Deviation
    name: Standard Deviation
    model: agg
    explore: feature_agg
    type: single_value
    fields: [feature_agg.feature_value]
    filters: {}
    sorts: [feature_agg.feature_value]
    limit: 500
    dynamic_fields: [{measure: sum_of_feature_value, based_on: feature_agg.feature_value,
        type: sum, label: Sum of Feature Value, expression: !!null '', _kind_hint: measure,
        _type_hint: number}, {measure: average_of_feature_value, based_on: feature_agg.feature_value,
        type: average, label: Average of Feature Value, expression: !!null '', _kind_hint: measure,
        _type_hint: number}, {table_calculation: standard_deviation, label: standard
          deviation, expression: 'round(stddev_pop(${feature_agg.feature_value}),2)',
        value_format: !!null '', value_format_name: !!null '', is_disabled: false,
        _kind_hint: dimension, _type_hint: number}]
    query_timezone: America/Los_Angeles
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
      options:
        steps: 5
        reverse: true
    conditional_formatting: [{type: equal to, value: !!null '', background_color: !!null '',
        font_color: !!null '', color_application: {collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7,
          palette_id: 1e4d66b9-f066-4c33-b0b7-cc10b4810688}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
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
    defaults_version: 1
    series_types: {}
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    font_size: 12
    up_color: "#FBB555"
    down_color: "#75E2E2"
    total_color: "#E57947"
    hidden_fields: [feature_agg.feature_value]
    listen:
      Source Type: feature_agg.src_type
      Type: feature_agg.type1
      Date: feature_agg.date
      H/Y/M/D: feature_agg.date_type1
      feature: feature_agg.feature
    row: 0
    col: 9
    width: 7
    height: 2
  - title: Count
    name: Count
    model: agg
    explore: feature_agg
    type: single_value
    fields: [feature_agg.feature, count_of_feature_value]
    filters: {}
    limit: 500
    dynamic_fields: [{measure: sum_of_feature_value, based_on: feature_agg.feature_value,
        expression: '', label: Sum of Feature Value, type: sum, _kind_hint: measure,
        _type_hint: number}, {measure: average_of_feature_value, based_on: feature_agg.feature_value,
        expression: '', label: Average of Feature Value, type: average, _kind_hint: measure,
        _type_hint: number}, {measure: count_of_feature_value, based_on: feature_agg.feature_value,
        expression: '', label: Count of Feature Value, type: count_distinct, _kind_hint: measure,
        _type_hint: number}]
    query_timezone: America/Los_Angeles
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
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
    color_application:
      collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
      palette_id: fb7bb53e-b77b-4ab6-8274-9d420d3d73f3
      options:
        steps: 5
        reverse: true
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
    defaults_version: 1
    series_types: {}
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    font_size: 12
    up_color: "#FBB555"
    down_color: "#75E2E2"
    total_color: "#E57947"
    listen:
      Source Type: feature_agg.src_type
      Type: feature_agg.type1
      Date: feature_agg.date
      H/Y/M/D: feature_agg.date_type1
      feature: feature_agg.feature
    row: 0
    col: 0
    width: 3
    height: 2
  - title: Mean
    name: Mean
    model: agg
    explore: feature_agg
    type: single_value
    fields: [feature_agg.feature, average_of_feature_value]
    filters: {}
    sorts: [average_of_feature_value desc]
    limit: 500
    dynamic_fields: [{measure: sum_of_feature_value, based_on: feature_agg.feature_value,
        expression: '', label: Sum of Feature Value, type: sum, _kind_hint: measure,
        _type_hint: number}, {measure: average_of_feature_value, based_on: feature_agg.feature_value,
        expression: '', label: Average of Feature Value, type: average, _kind_hint: measure,
        _type_hint: number}]
    query_timezone: America/Los_Angeles
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
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
    color_application:
      collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
      palette_id: fb7bb53e-b77b-4ab6-8274-9d420d3d73f3
      options:
        steps: 5
        reverse: true
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
    defaults_version: 1
    series_types: {}
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    font_size: 12
    up_color: "#FBB555"
    down_color: "#75E2E2"
    total_color: "#E57947"
    listen:
      Source Type: feature_agg.src_type
      Type: feature_agg.type1
      Date: feature_agg.date
      H/Y/M/D: feature_agg.date_type1
      feature: feature_agg.feature
    row: 0
    col: 3
    width: 6
    height: 2
  - title: Feature Name
    name: Feature Name
    model: agg
    explore: feature_agg
    type: single_value
    fields: [feature_agg.feature]
    filters: {}
    sorts: [feature_agg.feature]
    limit: 500
    dynamic_fields: [{measure: sum_of_feature_value, based_on: feature_agg.feature_value,
        type: sum, label: Sum of Feature Value, expression: !!null '', _kind_hint: measure,
        _type_hint: number}, {measure: average_of_feature_value, based_on: feature_agg.feature_value,
        type: average, label: Average of Feature Value, expression: !!null '', _kind_hint: measure,
        _type_hint: number}, {table_calculation: standard_deviation, label: standard
          deviation, expression: 'round(stddev_pop(${feature_agg.feature_value}),2)',
        value_format: !!null '', value_format_name: !!null '', is_disabled: true,
        _kind_hint: dimension, _type_hint: number}]
    query_timezone: America/Los_Angeles
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    color_application:
      collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
      palette_id: fb7bb53e-b77b-4ab6-8274-9d420d3d73f3
      options:
        steps: 5
        reverse: true
    custom_color: "#171717"
    conditional_formatting: [{type: equal to, value: !!null '', background_color: !!null '',
        font_color: !!null '', color_application: {collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7,
          palette_id: 1e4d66b9-f066-4c33-b0b7-cc10b4810688}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
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
    defaults_version: 1
    series_types: {}
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    font_size: 12
    up_color: "#FBB555"
    down_color: "#75E2E2"
    total_color: "#E57947"
    hidden_fields: []
    listen:
      Source Type: feature_agg.src_type
      Type: feature_agg.type1
      Date: feature_agg.date
      H/Y/M/D: feature_agg.date_type1
      feature: feature_agg.feature
    row: 0
    col: 16
    width: 8
    height: 2
  - title: Box Plot
    name: Box Plot
    model: agg
    explore: feature_agg
    type: looker_boxplot
    fields: [feature_agg.feature, feature_agg.minimum_value, feature_agg.25th_percentile_value,
      feature_agg.median_value, feature_agg.75th_percentile_value, feature_agg.maximum_value]
    filters: {}
    sorts: [feature_agg.minimum_value desc]
    limit: 500
    dynamic_fields: [{measure: sum_of_feature_value, based_on: feature_agg.feature_value,
        expression: '', label: Sum of Feature Value, type: sum, _kind_hint: measure,
        _type_hint: number}]
    query_timezone: America/Los_Angeles
    x_axis_gridlines: true
    y_axis_gridlines: true
    show_view_names: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 2
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    color_application:
      collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
      palette_id: fb7bb53e-b77b-4ab6-8274-9d420d3d73f3
      options:
        steps: 5
        reverse: true
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
    defaults_version: 1
    series_types: {}
    listen:
      Source Type: feature_agg.src_type
      Type: feature_agg.type1
      Date: feature_agg.date
      H/Y/M/D: feature_agg.date_type1
      feature: feature_agg.feature
    row: 2
    col: 0
    width: 9
    height: 12
  - title: Bin Distribution (copy)
    name: Bin Distribution (copy)
    model: agg
    explore: feature_agg
    type: looker_column
    fields: [feature_agg.dynamic_bucket, feature_agg.count]
    filters: {}
    sorts: [feature_agg.dynamic_bucket]
    limit: 500
    dynamic_fields: [{measure: sum_of_feature_value, based_on: feature_agg.feature_value,
        expression: '', label: Sum of Feature Value, type: sum, _kind_hint: measure,
        _type_hint: number}]
    query_timezone: America/Los_Angeles
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
      palette_id: fb7bb53e-b77b-4ab6-8274-9d420d3d73f3
      options:
        steps: 5
        reverse: true
    limit_displayed_rows_values:
      show_hide: hide
      first_last: first
      num_rows: 0
    hide_legend: false
    series_types: {}
    series_colors:
      feature_agg.count: "#C2DD67"
    defaults_version: 1
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
    show_null_points: true
    interpolation: linear
    value_labels: legend
    label_type: labPer
    leftAxisLabelVisible: false
    leftAxisLabel: ''
    rightAxisLabelVisible: false
    rightAxisLabel: ''
    smoothedBars: false
    orientation: automatic
    labelPosition: left
    percentType: total
    percentPosition: inline
    valuePosition: right
    labelColorEnabled: false
    labelColor: "#FFF"
    listen:
      Source Type: feature_agg.src_type
      Type: feature_agg.type1
      Date: feature_agg.date
      H/Y/M/D: feature_agg.date_type1
      feature: feature_agg.feature
      BINs: feature_agg.feature_buckets
      Bin Size: feature_agg.bucket_size
    row: 2
    col: 9
    width: 15
    height: 6
  - title: Details
    name: Details
    model: agg
    explore: feature_agg
    type: table
    fields: [feature_agg.name, feature_agg.event_start_date, feature_agg.event_end_date,
      feature_agg.feature, feature_agg.feature_value]
    filters: {}
    limit: 500
    dynamic_fields: [{measure: sum_of_feature_value, based_on: feature_agg.feature_value,
        expression: '', label: Sum of Feature Value, type: sum, _kind_hint: measure,
        _type_hint: number}]
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
    value_labels: labels
    label_type: labPer
    series_types: {}
    defaults_version: 1
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
    show_null_points: true
    interpolation: linear
    transpose: false
    truncate_text: true
    size_to_fit: true
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    listen:
      Source Type: feature_agg.src_type
      Type: feature_agg.type1
      Date: feature_agg.date
      H/Y/M/D: feature_agg.date_type1
      feature: feature_agg.feature
    row: 14
    col: 0
    width: 24
    height: 6
  - title: User Distribution
    name: User Distribution
    model: agg
    explore: feature_agg
    type: looker_column
    fields: [feature_agg.name, sum_of_feature_value]
    filters: {}
    limit: 500
    dynamic_fields: [{measure: sum_of_feature_value, based_on: feature_agg.feature_value,
        expression: '', label: Sum of Feature Value, type: sum, _kind_hint: measure,
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
    color_application:
      collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
      palette_id: fb7bb53e-b77b-4ab6-8274-9d420d3d73f3
      options:
        steps: 5
        reverse: true
    defaults_version: 1
    series_types: {}
    listen:
      Source Type: feature_agg.src_type
      Type: feature_agg.type1
      Date: feature_agg.date
      H/Y/M/D: feature_agg.date_type1
      feature: feature_agg.feature
    row: 8
    col: 9
    width: 15
    height: 6
  - title: Bin Distribution
    name: Bin Distribution
    model: agg
    explore: feature_agg
    type: looker_bar
    fields: [feature_agg.count, feature_agg.feature_compare_groups]
    filters: {}
    sorts: [feature_agg.count desc]
    limit: 500
    dynamic_fields: [{measure: sum_of_feature_value, based_on: feature_agg.feature_value,
        expression: '', label: Sum of Feature Value, type: sum, _kind_hint: measure,
        _type_hint: number}]
    query_timezone: America/Los_Angeles
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
      palette_id: fb7bb53e-b77b-4ab6-8274-9d420d3d73f3
      options:
        steps: 5
        reverse: true
    limit_displayed_rows_values:
      show_hide: hide
      first_last: first
      num_rows: 0
    hide_legend: false
    series_types: {}
    defaults_version: 1
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
    show_null_points: true
    interpolation: linear
    value_labels: legend
    label_type: labPer
    leftAxisLabelVisible: false
    leftAxisLabel: ''
    rightAxisLabelVisible: false
    rightAxisLabel: ''
    smoothedBars: false
    orientation: automatic
    labelPosition: left
    percentType: total
    percentPosition: inline
    valuePosition: right
    labelColorEnabled: false
    labelColor: "#FFF"
    listen:
      Source Type: feature_agg.src_type
      Type: feature_agg.type1
      Date: feature_agg.date
      H/Y/M/D: feature_agg.date_type1
      feature: feature_agg.feature
      BINs: feature_agg.feature_buckets
    row: 20
    col: 0
    width: 15
    height: 5
  filters:
  - name: Source Type
    title: Source Type
    type: string_filter
    default_value: wgtraffic
    allow_multiple_values: true
    required: false
  - name: Type
    title: Type
    type: string_filter
    default_value: user
    allow_multiple_values: true
    required: false
  - name: Date
    title: Date
    type: string_filter
    default_value: '2020-05-13'
    allow_multiple_values: true
    required: false
  - name: H/Y/M/D
    title: H/Y/M/D
    type: string_filter
    default_value: D
    allow_multiple_values: true
    required: false
  - name: feature
    title: feature
    type: field_filter
    default_value: '"upld_bytes"'
    allow_multiple_values: true
    required: false
    model: agg
    explore: feature_agg
    listens_to_filters: []
    field: feature_agg.feature
  - name: BINs
    title: BINs
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    model: agg
    explore: feature_agg
    listens_to_filters: []
    field: feature_agg.feature_buckets
  - name: Bin Size
    title: Bin Size
    type: field_filter
    default_value: '10000'
    allow_multiple_values: true
    required: false
    model: agg
    explore: feature_agg
    listens_to_filters: []
    field: feature_agg.bucket_size
