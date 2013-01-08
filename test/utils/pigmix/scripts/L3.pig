--This script tests a join too large for fragment and replicate.  It also 
--contains a join followed by a group by on the same key, something that we
--could potentially optimize by not regrouping.
register ../../../../pigperf.jar;
A = load '/pigmix/pages625m' using org.apache.pig.test.udf.storefunc.PigPerformanceLoader()
    as (user, action, timespent, query_term, ip_addr, timestamp,
        estimated_revenue, page_info, page_links);
B = foreach A generate user, (double)estimated_revenue;
alpha = load '/pigmix/users' using PigStorage('\u0001') as (name, phone, address,
        city, state, zip);
beta = foreach alpha generate name;
C = join beta by name, B by user parallel $reducers;
D = group C by $0 parallel $reducers;
E = foreach D generate group, SUM(C.estimated_revenue);
store E into '/pigmixresults/L3out';

