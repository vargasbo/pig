-- This script tests using a join small enough to do in fragment and replicate. 
register ../../../../pigperf.jar;
A = load '/pigmix/pages625m' using org.apache.pig.test.udf.storefunc.PigPerformanceLoader()
    as (user, action, timespent, query_term, ip_addr, timestamp,
        estimated_revenue, page_info, page_links);
B = foreach A generate user, estimated_revenue;
alpha = load '/pigmix/power_users' using PigStorage('\u0001') as (name, phone,
        address, city, state, zip);
beta = foreach alpha generate name;
C = join B by user, beta by name using 'replicated' parallel $reducers;
store C into '/pigmixresults/L2out';

