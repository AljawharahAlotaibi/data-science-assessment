SELECT 
    it.investor_id,
    s.sector_name,
    ROUND((it.no_of_shares * 100.0 / ts.total_shares), 2) AS share_percentage
FROM investor_transactions it
JOIN sectors s 
    ON it.sector_id = s.sector_id
JOIN (
    SELECT investor_id, SUM(no_of_shares) AS total_shares
    FROM investor_transactions
    GROUP BY investor_id
) ts 
    ON it.investor_id = ts.investor_id
ORDER BY 
    it.investor_id,
    share_percentage;
