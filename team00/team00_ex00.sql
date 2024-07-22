/*
There are 4 cities (a, b, c and d) and arcs between them with costs (or taxes). 
Actually, the cost is (a,b) = (b,a).
Please create a table with named nodes using structure {point1, point2, cost} 
and fill data (remember there are direct and reverse paths between 2 nodes).
Please write a SQL statement that returns all tours (aka paths) with minimum 
travel cost if we start from city "a".
Remember, you need to find the cheapest way to visit all cities and return to 
your starting point. For example, the tour looks like a -> b -> c -> d -> a.
Please sort the data by total_cost and then by tour.
*/

create table nodes
        (point1 varchar,
       point2 varchar,
       cost numeric);

        insert into nodes values ('a','b',10);
        insert into nodes values ('b','a',10);
        insert into nodes values ('b','c',35);
        insert into nodes values ('c','b',35);
        insert into nodes values ('c','a',15);
        insert into nodes values ('a','c',15);
        insert into nodes values ('c','d',30);
        insert into nodes values ('d','c',30);
        insert into nodes values ('a','d',20);
        insert into nodes values ('d','a',20);
        insert into nodes values ('b','d',25);
        insert into nodes values ('d','b',25);

        with t as (
        with recursive rec as
        (select point1, point2, cost,
                1 as level,
                array[point1] AS path,
                FALSE AS cycle,
                array[cost] AS costs
        from nodes
        where point1 = 'a'
        union all
        select nodes.point1,
                nodes.point2,
                nodes.cost+rec.cost as cost,
                rec.level+1 as level,
                rec.path || nodes.point1 AS path,
                nodes.point1 = ANY (rec.path) AS cycle,
                rec.costs || nodes.cost AS costs
        from nodes inner join rec on rec.point2 = nodes.point1 and not cycle
        )
        select
            cost - costs[5] as total_cost,
            path as tour
        from rec
        where level =5 and
            'a' = ANY(path) and
            'b' = ANY(path) and
            'c' = ANY(path) and
            'd' = ANY(path)
           and path[1] = path[5]
        order by cost, path)
        select distinct *
        from t
        where total_cost = (select  min(total_cost) from t)
        order by 1,2;