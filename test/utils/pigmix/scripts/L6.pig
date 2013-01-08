-- This script covers the case where the group by key is a significant
-- percentage of the row.
register ../../../../pigperf.jar;
A = load '/pigmix/pages625m' using org.apache.pig.test.udf.storefunc.PigPerformanceLoader()
    as (user, action, timespent, query_term, ip_addr, timestamp,
        estimated_revenue, page_info, page_links);
B = foreach A generate user, action, (int)timespent as timespent, query_term, ip_addr, timestamp;
C = group B by (user, query_term, ip_addr, timestamp) parallel $reducers;
D = foreach C generate flatten(group), SUM(B.timespent);
store D into '/pigmixresults/L6out';

