-- This script covers distinct and union.
register ../../../../pigperf.jar;
A = load '/pigmix/pages625m' using org.apache.pig.test.udf.storefunc.PigPerformanceLoader()
    as (user, action, timespent, query_term, ip_addr, timestamp,
        estimated_revenue, page_info, page_links);
B = foreach A generate user;
C = distinct B parallel $reducers;
alpha = load '/pigmix/widerow' using PigStorage('\u0001');
beta = foreach alpha generate $0 as name;
gamma = distinct beta parallel $reducers;
D = union C, gamma;
E = distinct D parallel $reducers;
store E into '/pigmixresults/L11out';
