<?php
/**
 * Created by PhpStorm.
 * User: moTzxx
 * Date: 2017/12/28
 * Time: 17:47
 */

/**
 * 公用的方法  返回json数据，进行信息的提示
 * @param $status 状态
 * @param string $message 提示信息
 * @param array $data 返回数据
 */
function showMsg($status, $message = '', $data = array())
{
    $result = array(
        'status' => $status,
        'message' => $message,
        'data' => $data
    );
    exit(json_encode($result));
}

if (!function_exists('pr')) {
//传递数据以易于阅读的样式格式化后输出
    function pr($data)
    {
        // 定义样式
        $str = '<pre style="display: block;padding: 9.5px;margin: 44px 0 0 0;font-size: 13px;line-height: 1.42857;color: #333;word-break: break-all;word-wrap: break-word;background-color: #F5F5F5;border: 1px solid #CCC;border-radius: 4px;">';
        // 如果是boolean或者null直接显示文字；否则print
        if (is_bool($data)) {
            $show_data = $data ? 'true' : 'false';
        } elseif (is_null($data)) {
            $show_data = 'null';
        } else {
            $show_data = print_r($data, true);
        }
        $str .= $show_data;
        $str .= '</pre>';
        echo $str;
    }
}

if (!function_exists('p')) {
    // 传递数据以易于阅读的样式格式化后输出
    function p($data, $toArray = true)
    {
        // 定义样式
        $str = '<pre style="display: block;padding: 9.5px;margin: 44px 0 0 0;font-size: 13px;line-height: 1.42857;color: #333;word-break: break-all;word-wrap: break-word;background-color: #F5F5F5;border: 1px solid #CCC;border-radius: 4px;">';
        // 如果是 boolean 或者 null 直接显示文字；否则 print
        if (is_bool($data)) {
            $show_data = $data ? 'true' : 'false';
        } elseif (is_null($data)) {
            // 如果是null 直接显示null
            $show_data = 'null';
        } elseif (is_object($data) && in_array(get_parent_class($data), ['Illuminate\Support\Collection', 'App\Models\Base']) && $toArray) {
            // 把一些集合转成数组形式来查看
            $data_array = $data->toArray();
            $show_data = '这是被转成数组的Collection:<br>' . print_r($data_array, true);
        } elseif (is_object($data) && in_array(get_class($data), ['Maatwebsite\Excel\Readers\LaravelExcelReader']) && $toArray) {
            // 把一些集合转成数组形式来查看
            $data_array = $data->toArray();
            $show_data = '这是被转成数组的Collection:<br>' . print_r($data_array, true);
        } elseif (is_object($data) && in_array(get_class($data), ['Illuminate\Database\Eloquent\Builder'])) {
            // 直接调用dd 查看
            dd($data);
        } else {
            $show_data = print_r($data, true);
        }
        $str .= $show_data;
        $str .= '</pre>';
        echo $str;
    }
}
if (!function_exists('pd')) {
    // 传递数据以易于阅读的样式格式化后输出并终止
    function pd($data, $toArray = true)
    {
        p($data, $toArray);
        die;
    }
}