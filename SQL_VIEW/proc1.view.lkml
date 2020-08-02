view: proc1 {
  derived_table: {
    sql: SELECT * FROM udfSTL() ;;
    }

dimension: STL_Name {
  type: string
  sql: ${TABLE}."STL_Name" ;;
}

dimension: STL_Symbol {
  type: string
  sql: ${TABLE}."STL_Symbol" ;;
}

dimension: STL_Description {
  type: string
  sql: ${TABLE}."STL_Description" ;;
}
}
