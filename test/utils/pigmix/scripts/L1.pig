-- This script tests reading from a map, flattening a bag of maps, and use of bincond.
--register ../../../../pigperf.jar;
--register ../../../../pigperf.jar;
register /root/pig-0.9.2/pigperf.jar;
A = load '/pigmix/pages625m' using org.apache.pig.test.udf.storefunc.PigPerformanceLoader()
    as (user, action, timespent, query_term, ip_addr, timestamp,
        estimated_revenue, page_info, page_links);
B = foreach A generate user, (int)action as action, (map[])page_info as page_info,
    flatten((bag{tuple(map[])})page_links) as page_links;
C = foreach B generate user,
    (action == 1 ? page_info#'a' : page_links#'b') as header;
D = group C by user parallel $reducers;
E = foreach D generate group, COUNT(C) as cnt;
store E into '/pigmixresults/L1out';


