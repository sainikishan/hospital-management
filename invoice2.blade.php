@php
$color_header = '#F0F0F0';
$color_border = '#000000';
$color_border_lighter = '#CCCCCC';
$color_line_even = '#FFFFFF';
$color_line_odd = '#F9F9F9';
$font_size_text = '9pt';
$font_size_header = '9pt';
$font_size_product = '9pt';
$height_header = '20px';
$table_padding = '4px';
$box_color = '#eaeaf1';
@endphp
<style>
    table,
    th,
    td {
        margin: 0 !important;
        padding: 0 !important;
        vertical-align: middle;
        font-size: {{ $font_size_text }};
        white-space: nowrap;
    }

    table#addresses-tab tr td {
        font-size: large;
    }
    .address-text {
        font-weight: bold;
    }
    table.product {
        /*border: 0.5px solid {{ $color_border }};*/
        border-collapse: collapse;
    }

    th.header {
        font-size: {{ $font_size_header }};
        height: {{ $height_header }};
        /*border: 0.5px solid {{ $color_border }};*/
        vertical-align: middle;
        text-align: center;
        font-weight: bold;
        background-color:#eaeaf1;
    }
    .small,
    table.small th,
    table.small td {
        font-size: medium;
    }

    tr.cutomtr {
      display: block;
      margin-bottom: 1.5rem;
      padding: 1rem 0.5rem 0.5rem 1rem;
    }
    td.customtd {
      display: inline-block;
      margin: 0 0.5rem 0.5rem 0;
      padding: 0.5rem;
      text-align: left;
      background-color: white;
      border: 1px solid transparentize( #58C25F, 0.5 );
    }
    td:before {
      float: left;
      margin: -0.5rem 0.5rem -0.5rem -0.5rem;
      padding: 0.625rem 0.5rem 0.625rem;
      font-size: 0.75em;
      font-weight: bold;
      background: transparentize( #58C25F, 0.9 );
      color: #58C25F;
    }
    .row{
      box-sizing: border-box;
      background: #fff;
      border-radius: inherit;
      box-shadow: 0 .5em 1em 0 rgb(0 0 0 / .15);
    }
    /*.new1 {
      border-top: 1px dashed black;
    }*/
    .vertical {
        border-left: 0.5px solid black;
        height: 8px;
        position:absolute;
        left: 50%;
    }
    
</style>
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<table width="100%" border="0" cellpadding="0" cellspacing="0">
  
  <tr colspan="12">
    <td colspan="5">
      <table id="addresses-tab" cellspacing="0" cellpadding="0">
        <tr>
          <td colspan="3">
            <br />
            <span class="address-text">@lang('Raiffeisen OÖ Ventures eGen:') </span> <br /> <br />
            Europapl. 1a <br />
            4020 Linz <br />
            Österreich <br />

          </td>
          <td colspan="3"></td>
        </tr>
        <br />
        <tr>
          <td colspan="3">
            <br />
            <span class="address-text">@lang('Rechnungsadresse') </span> <br /> <br />
            {{ $provider_payout->provider->company_name }} <br />
            {{ $provider_payout->provider->street . ' ' . $provider_payout->provider->street_number }} <br />
            {{ $provider_payout->provider->postal_code . ' ' . $provider_payout->provider->city }} <br />
            Österreich <br />
          </td>
          <td colspan="3">
          </td>
        </tr>
      </table>
    </td>
    <td colspan="7">
   
      <table id="addresses-tab" cellspacing="0" cellpadding="0">
        <tr>
          <div style="border: 0.5px solid black; padding-top: 4px;">
            <tr>
              <td class="border" style="text-align: center;"><span class="address-text"style="line-height: 5px;">
                @lang('Rechnungs-Nr.: ')&nbsp;{{ $provider_payout->invoice_number }}</span>
              </td>
            </tr>
          </div>
          <br />
          <td>
            <table class="table__data mt-1">
              <tr style="line-height:20px"> 
                  <td style="text-align: left">
                    <span class="small">@lang('Rechnungsdatum: ')</span>
                  </td>
                  <td>
                    <span class="small">{{ $provider_payout->updated_at->format(setting('date_format')) }}</span>
                  </td>
              </tr>
              <tr style="line-height:20px">
                <td>
                  <span class="small">@lang('Kunden-Nr.:')</span>
                </td>
                <td>
                  <span class="small">{{ $provider_payout->provider_id }}</span>
                </td>
              </tr>
               <tr style="line-height:20px"> 
                  <td style="text-align: left">
                    <span class="small">@lang('USt.-ID:')</span>
                  </td>
                  <td>
                    <span class="small">{{ $provider_payout->provider->vat_number }}</span>
                  </td>
                </tr> 
                <tr style="line-height:20px"> 
                  <td style="text-align: left">
                    <span class="small">@lang('Liefer-/Leistungsdatum:')</span>
                  </td>
                  <td>
                    <span class="small">{{ $provider_payout->start_period_date->format(setting('date_format')) . ' - ' . $provider_payout->end_period_date->format(setting('date_format')) }}</span>
                  </td>
                </tr>
            </table>
          </td>
        </tr>
      </table>
    </td>
  </tr>

  <tr colspan="12">
    <td colspan="12">
      <table class="product" width="100%" cellpadding="5" cellspacing="0">
        <thead>
          <tr>
            <th class="product header text-wrap">@lang('Re-Nr.& Re-Datum')</th>
            <th class="product header text-wrap">@lang('Artikel-Nr. & Versand')</th>
            <th class="product header text-wrap">@lang('Artikel-preis(Brutto)')</th>
            <th class="product header text-wrap">@lang('Versand-umsatz(Brutto)')</th>
            <th class="product header text-wrap">@lang('finde-R Umsatz-provision')</th>
            <th class="product header text-wrap">@lang('finde-R Payment-Gebühr')</th>
            <th class="product header text-wrap">@lang('finde-R Aktions-rabatt')</th>
            <th class="product header text-wrap">@lang('MwSt 20%')</th>
            <th class="product header text-wrap">@lang('finde-R Gesamt(Brutto)')</th>
            </tr>
        </thead>
          <tbody>
            @foreach($vendor_orders as $vendor_order)
              @foreach($vendor_order->order_items->loadMissing('product') as $item)
                <tr style="text-align: center;">
                  @if($loop->iteration > 1)
                    <td></td>
                  @else
                    <td>{{ $vendor_order->invoice_number }}</td>
                  @endif
                  <td>{{ $item->product->article_number }}</td>
                  <td>{{ $item->getPriceIncluded() * $item->quantity }} €</td> 
                  <td>n/a</td> 
                </tr>
              @endforeach
              @foreach($vendor_order->order_items as $item)
                <tr style="text-align: center;">
                  @if($loop->iteration > 1)
                    <td></td>
                  @else
                    <td>{{ $vendor_order->created_at->format(setting('date_format')) }}</td>
                  @endif
                  <td>Versand</td>  
                  <td>n/a</td> 
                  <td>{{ $item->shipping_info->shipping_cost }} €</td>
                </tr>
              @endforeach
              <tr style="text-align: center;">
                <td></td>
                <td>Gesmat</td>  
                <td>{{ $vendor_order->amount_tax_included }} €</td> 
                <td>{{ $vendor_order->shipping_amount }} €</td>
                <td>{{ $vendor_order->sales_commission }} €</td>
                <td>{{ $vendor_order->transaction_fee }} €</td>
                <td><span class="small">@lang('-') </span>{{ $vendor_order->discount_amount }} €</td>
                <td>{{ round((($vendor_order->sales_commission + $vendor_order->transaction_fee)*20)/100,2) }} €</td>
                <td>{{ $vendor_order->sales_commission + $vendor_order->transaction_fee + $vendor_order->discount_amount  }} €</td>
              </tr>
              <br />
              <hr>
            @endforeach
          </tbody>
      </table>
    </td>
  </tr>
</table>




