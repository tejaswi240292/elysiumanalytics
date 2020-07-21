- dashboard: data_collection
  title: DATA Collection
  layout: newspaper
  elements:
  - title: Data Collection
    name: Data Collection
    model: itd
    explore: dataview
    type: table
    fields: [dataview.source_type, dataview.date_time_hour, ingested_count, commited_count]
    pivots: [dataview.date_time_hour]
    fill_fields: [dataview.date_time_hour]
    filters: {}
    sorts: [dataview.date_time_hour desc, sum_of_ingested_count desc 0]
    limit: 500
    dynamic_fields: [{measure: commited_count, based_on: dataview.commited_count,
        type: sum, label: Commited Count, expression: !!null '', value_format: !!null '',
        value_format_name: !!null '', _kind_hint: measure, _type_hint: number}, {
        measure: sum_of_commited_count, based_on: dataview.commited_count, type: sum,
        label: Sum of Commited Count, expression: !!null '', _kind_hint: measure,
        _type_hint: number}, {measure: ingested_count, based_on: dataview.ingested_count,
        type: sum, label: Ingested Count, expression: !!null '', value_format: !!null '',
        value_format_name: !!null '', _kind_hint: measure, _type_hint: number}]
    show_view_names: true
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: transparent
    limit_displayed_rows: false
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_labels:
      sum_of_commited_count_2: Commited Count (Sum)
      dataview.count: Volume
    conditional_formatting: [{type: equal to, value: 0, background_color: "#B32F37",
        font_color: !!null '', color_application: {collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7,
          palette_id: afd46b40-e939-4ace-bffd-69d1bb16ee05, options: {steps: 5, constraints: {
              min: {type: minimum}, mid: {type: number, value: 12}, max: {type: maximum}},
            mirror: true, reverse: false, stepped: true}}, bold: true, italic: false,
        strikethrough: false, fields: !!null ''}, {type: not equal to, value: 0, background_color: "#72D16D",
        font_color: !!null '', color_application: {collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7,
          palette_id: 1e4d66b9-f066-4c33-b0b7-cc10b4810688, options: {constraints: {
              min: {type: minimum}, mid: {type: number, value: 0}, max: {type: maximum}},
            mirror: true, reverse: false, stepped: false}}, bold: true, italic: false,
        strikethrough: false, fields: !!null ''}]
    transpose: false
    truncate_text: true
    size_to_fit: true
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    series_column_widths:
      dataview.date_time_hour: 193
    series_cell_visualizations:
      dataview.count:
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
    listen:
      Date: dataview.datefilter
    row: 0
    col: 0
    width: 24
    height: 9
  filters:
  - name: Date
    title: Date
    type: date_filter
    default_value: 7 days
    allow_multiple_values: true
    required: false
