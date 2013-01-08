register ../../../../pigperf.jar;
A = load '/pigmix/pages625m' using org.apache.pig.test.udf.storefunc.PigPerformanceLoader()
    as (user, action, timespent, query_term, ip_addr, timestamp, estimated_revenue, page_info, page_links);
B = foreach A generate user, estimated_revenue;
C = group B by user parallel $reducers;
D = foreach C {
    E = order B by estimated_revenue;
    F = E.estimated_revenue;
    generate group, SUM(F);
}

store D into '/pigmixresults/L16out';

