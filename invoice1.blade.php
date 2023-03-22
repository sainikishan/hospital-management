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
    .small,
    table.small th,
    table.small td {
        font-size: medium;
    }
    
</style>
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<table width="100%" id="body" border="0" cellpadding="0" cellspacing="0">
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
              </tr> <tr style="line-height:20px"> 
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
  <br>
  <tr colspan="12">
    <td colspan="4">
      <span class="address-text">@lang('Anfangssaldo')</span>
    </td>
    <td colspan="6">
      <span class="address-text">@lang('nicht ausbezahlter Umsatz des vorherigen Abrechnungszeitraum')</span>
      
    </td>
    <td colspan="2">
      <span class="address-text">@lang('0 €')</span>    
    </td>
  </tr>
  <hr />

  <tr colspan="12">
    <td colspan="5">
      <br />
      <br />
      <table id="addresses-tab" cellspacing="0" cellpadding="0">
        <tr>
          <td colspan="3">
            <br />
            <span class="address-text">@lang('Raiffeisen OÖ Ventures eGen:') </span> <br /> <br />
          </td>
          <td colspan="3"></td>
        </tr>
        <br />
      </table>
    </td>
    <td colspan="7">
      <br />
      <br />
      <table id="addresses-tab" cellspacing="0" cellpadding="0">
        <tr>
          <td>
            <table class="table__data">
              <tr style="line-height:20px"> 
                  <td style="text-align: left">
                    <span class="small">@lang('Artikelpreis:')</span>
                  </td>
                  <td>
                    <span class="small">{{ $vendor_orders->sum('amount_tax_included') }} €</span>
                  </td>
              </tr>
              <tr style="line-height:20px">
                <td>
                  <span class="small">@lang('Versandumsatz:')</span>
                </td>
                <td>
                  <span class="small">{{ $vendor_orders->sum('shipping_amount') }} €</span>
                </td>
              </tr>
               <tr style="line-height:20px"> 
                  <td style="text-align: left">
                    <span class="small">@lang('gewährte Gutscheine:')</span>
                  </td>
                  <td>
                    <span class="small"><span class="small">@lang('-') </span>{{ $vendor_orders->sum('discount_amount') }} €</span>
                  </td>
              </tr> 
              <tr style="line-height:20px"> 
                  <td style="text-align: left">
                    <span class="small">@lang('erhaltene Gutschriften:')</span>
                  </td>
                  <td>
                    <span class="small">0 €</span>
                  </td>
              </tr>
              <tr style="line-height:20px"> 
                  <td style="text-align: left">
                    <span class="small">@lang('Retoure:')</span>
                  </td>
                  <td>
                    <span class="small"><span class="small">@lang('-') </span>0 €</span>
                  </td>
              </tr>
              <hr />
              <tr style="line-height:20px"> 
                <td style="text-align: left">
                </td>
                <td>
                  <span class="small">@lang('Kontosaldo.: ')<span class="address-text">{{ ($vendor_orders->sum('amount_tax_included') + $vendor_orders->sum('shipping_amount')) - $vendor_orders->sum('discount_amount') }} €</span></span>
                </td>
              </tr>
            </table>
          </td>
        </tr>
      </table>
      <hr />
      <table id="addresses-tab" cellspacing="0" cellpadding="0">
        <tr>
          <td>
            <br>
            <br>
            <table class="table__data mt-1">
              <tr style="line-height:20px"> 
                  <td style="text-align: left">
                    <span class="small">@lang('Umsatzprovision:')</span>
                  </td>
                  <td>
                    <span class="small">{{ $vendor_orders->sum('sales_commission') }} €</span>
                  </td>
              </tr>
              <tr style="line-height:20px">
                <td>
                  <span class="small">@lang('Payment Gebühr:')</span>
                </td>
                <td>
                  <span class="small">{{ $vendor_orders->sum('transaction_fee') }} €</span>
                </td>
              </tr>
              <tr style="line-height:20px"> 
                  <td style="text-align: left">
                    <span class="small">@lang('Aktionsrabatt von finde-R:')</span>
                  </td>
                  <td>
                    <span class="small"><span class="small">@lang('-') </span>{{ $vendor_orders->sum('discount_amount') }} €</span>
                  </td>
              </tr>              
            </table>
            @php
            $complete_finder_amount_excl_tax = ($vendor_orders->sum('sales_commission') + $vendor_orders->sum('transaction_fee')) - $vendor_orders->sum('discount_amount');
            $tax_rate= ((20 * $vendor_orders->sum('sales_commission'))/100) + ((20 * $vendor_orders->sum('transaction_fee'))/100);           
            $complete_finder_amount_incl_tax = $complete_finder_amount_excl_tax + $tax_rate;
            $complete_amount = ($vendor_orders->sum('amount_tax_included') + $vendor_orders->sum('shipping_amount')) - $vendor_orders->sum('discount_amount');
            @endphp
            <hr>
            <tr style="line-height:20px"> 
              <td style="text-align: left">
              </td>
              <td>
                <span class="small">@lang('finde-R Gebühren netto.: ')<span class="address-text">{{ $complete_finder_amount_excl_tax }} €</span></span>
              </td>
            </tr>   
            <tr style="line-height:20px"> 
              <td style="text-align: left">
              </td>
              <td>
                <span class="small">@lang('MwSt. 20%.: ')<span class="address-text">{{ $tax_rate }} €</span></span>
              </td>
            </tr>   
            <hr />
            <tr style="line-height:20px"> 
              <td style="text-align: left">
              </td>
              <td>
                <span class="small">@lang('finde-R Gebühren brutto.: ')<span class="address-text">{{ $complete_finder_amount_incl_tax }} €</span></span>
              </td>
            </tr> 
            <hr />
            <tr style="line-height:20px"> 
              <td style="text-align: left">
              </td>
              <td style="text-align: left;">
                <span class="small">@lang('Monatssaldo.: ')<span class="address-text">{{ $complete_amount - $complete_finder_amount_incl_tax }} €</span></span>
              </td>
            </tr> 
          </td>
        </tr>
      </table>
    </td>
  </tr>
  <hr>

  <tr colspan="12"> 
    <td colspan="4">
      <br>
      <br>
      <span class="address-text">@lang('Endsaldo')</span>
    </td>
    <td colspan="6">
      <br>
      <br>
      <span class="address-text">@lang('Zahlungsbetrag')</span>
    </td>
    <td colspan="2">
      <br>
      <br>
      <span class="address-text">{{ $complete_amount - $complete_finder_amount_incl_tax }} €</span>
    </td>
  </tr>
  <br>
  <br>
  
  <hr>
</table>



