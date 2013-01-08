-- This script covers multi-store queries.
register ../../../../pigperf.jar;
A = load '/pigmix/pages625m' using org.apache.pig.test.udf.storefunc.PigPerformanceLoader()
    as (user, action, timespent, query_term, ip_addr, timestamp,
        estimated_revenue, page_info, page_links);
B = foreach A generate user, action, (int)timespent as timespent, query_term,
    (double)estimated_revenue as estimated_revenue;
split B into C if user is not null, alpha if user is null;
split C into D if query_term is not null, aleph if query_term is null;
E = group D by user parallel $reducers;
F = foreach E generate group, MAX(D.estimated_revenue);
store F into '/pigmixresults/highest_value_page_per_user';
beta = group alpha by query_term parallel $reducers;
gamma = foreach beta generate group, SUM(alpha.timespent);
store gamma into '/pigmixresults/total_timespent_per_term';
beth = group aleph by action parallel $reducers;
gimel = foreach beth generate group, COUNT(aleph);
store gimel into '/pigmixresults/queries_per_action';
