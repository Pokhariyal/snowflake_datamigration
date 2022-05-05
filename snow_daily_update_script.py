import snow_update_etl as up
import snow_etl_utls as utl

################  Three source tables  ################
# purchaseorder
date_gaps = utl.check_table_for_date_gaps(
    table="adp_purchaseorder"
    , start_date=utl.get_previous_day(num_days=7)
    )
for date in date_gaps:
    up.update_purchaseorder(date)

# quotes
date_gaps = utl.check_table_for_date_gaps(
    table="adp_quote"
    , start_date=utl.get_previous_day(num_days=7)
    )
for date in date_gaps:
    up.update_contracts(date=date)

# adp_RFQ
# TODO don't hardcode this
date_gaps = utl.check_table_for_date_gaps(
    table="adp_RFQ"
    , start_date=utl.get_previous_day(num_days=7)
    )
for date in date_gaps:
    up.update_nft_trade_opensea(date, use_upsert=False)

up.update_address_metadata_trading_currency()