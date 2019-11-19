<?php

namespace App\Admin\Controllers\Backend;

use App\Http\Controllers\Controller;
use Brazzer\Admin\Form;
use Brazzer\Admin\Grid;
use Brazzer\Admin\Layout\Content;
use Brazzer\Admin\Show;
use Brazzer\Admin\Controllers\ModelForm;
use App\Models\ConfigSite;
use Brazzer\Admin\Facades\Admin;

class ConfigSiteController extends Controller
{
    use ModelForm;

    public function __construct()
    {
        //
    }

    /**
     * Return page index
     *
     * @param Content $content
     * @return Content
     */
    public function index(Content $content)
    {
        return $content
            ->header('Config Site')
            ->description(trans('admin.list'))
            ->body($this->grid());
    }

    /**
     * Return page edit
     *
     * @param Integer $id
     * @param Content $content
     * @return Content
     */
    public function edit($id, Content $content)
    {
        return $content
            ->header('Config Site')
            ->description(trans('admin.edit'))
            ->body(
                $this->form()->edit($id)
            );
    }

    /**
     * Return page create
     *
     * @param Content $content
     * @return Content
     */
    public function create(Content $content)
    {
        return $content
            ->header('Config Site')
            ->description(trans('admin.create'))
            ->body($this->form());
    }

    /**
     * Build table in page index
     *
     * @return Grid
     */
    protected function grid()
    {
        return ConfigSite::grid(function(Grid $grid)
        {
            $grid->model()->orderBy('id', 'desc');
            $grid->filter(function($filter){
                $filter->expand();
                $filter->disableIdFilter();
                $filter->like('code');
            });

            $grid->id();
            $grid->code();
            // $grid->disableRowSelector();

        });
    }

    /**
     * Build form for edit or create
     *
     * @return Form
     */
    public function form()
    {
        return ConfigSite::form(function (Form $form)
        {
            $form->hidden('id', 'ID');
            $form->text('code');
            $form->textarea('content');

            $form->footer(function ($footer)
            {
                $footer->disableViewCheck();
                $footer->disableEditingCheck();
                $footer->disableCreatingCheck();
            });

            Admin::script($this->script());

        });
    }

    /**
     * Return page detail
     *
     * @param Integer $id
     * @param Content $content
     * @return Content
     */
    public function show($id, Content $content)
    {
        return $content
            ->header('Config Site')
            ->description(trans('admin.detail'))
            ->body(
                    $this->detail($id)
            );
    }

    /**
     * Build detail contact form
     *
     * @param Integer $id
     * @return Show
     */
    protected function detail($id)
    {
        $show = new Show(ConfigSite::findOrFail($id));

        $show->code();

        $show->content()->as(function ($content) {
            return "<pre><span style='text-align: left'>{$content}</span></pre>";
        })->label('null');

        return $show;
    }

    public function script()
    {
        return <<<EOT
        $(document).ready(function() {
            $('textarea[name="content"]').summernote({
                height: 500
            });
        });
EOT;

    }
}
