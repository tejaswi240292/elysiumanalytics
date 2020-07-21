connection: "snowfalkedb"

include: "/dga_views/*.view.lkml"

datagroup:web_domain_stat_data
{
  max_cache_age:"2 hours"
#   sql_trigger:select max(FIRST_SEEN) from web_domain_stat;;
}

explore: web_domain_stat {
  persist_with: web_domain_stat_data
}
