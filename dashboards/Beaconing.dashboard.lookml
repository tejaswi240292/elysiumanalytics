- dashboard: beaconing
  title: beaconing
  layout: newspaper
  elements:
  - title: beaconing table
    name: beaconing table
    model: ml
    explore: beaconing_mlresult
    type: table
    fields: [beaconing_mlresult.first_event_date, beaconing_mlresult.src_ip, beaconing_mlresult.dst_ip,
      beaconing_mlresult.epoch_list, beaconing_mlresult.epoch_list_len, beaconing_mlresult.pattern,
      beaconing_mlresult.pattern_len, beaconing_mlresult.srcip_prev_score, beaconing_mlresult.dstip_prev_score,
      beaconing_mlresult.execution_timestamp]
    filters:
      beaconing_mlresult.first_event_date: 7 days
      beaconing_mlresult.pattern_len: ">1"
    sorts: [beaconing_mlresult.srcip_prev_score desc]
    limit: 500
    query_timezone: America/Los_Angeles
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
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    series_types: {}
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    transpose: false
    truncate_text: true
    size_to_fit: true
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    listen: {}
    row: 0
    col: 0
    width: 24
    height: 11
