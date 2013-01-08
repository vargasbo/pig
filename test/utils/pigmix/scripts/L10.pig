--This script covers order by of multiple values.
register ../../../../pigperf.jar;
A = load '/pigmix/pages625m' using org.apache.pig.test.udf.storefunc.PigPerformanceLoader()
    as (user, action, timespent:int, query_term, ip_addr, timestamp,
        estimated_revenue:double, page_info, page_links);
B = order A by query_term, estimated_revenue desc, timespent parallel $reducers;
store B into '/pigmixresults/L10out';
